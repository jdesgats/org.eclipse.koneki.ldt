This document introduces the concept of custom inspectors which allows you
to plug your own logic to decode children properties debugging.

This document is a tutorial, it just introduces concepts and best practices. 
For details about used functions, see the `debugger.introspection` API 
documentation.

There are two main uses cases:

* Enumerate properties of userdata object (which debugger cannot inspect at all
  out of the box)
* Customize debugging of tables to hide internal fields and reduce noise

The provided API tries to be as simple as possible by hiding most debugger <=> IDE
communication logic such as recursion limit, pagination, ... However it is not
yet considerated as final and may change without notice.

# Inspector modules
The inspectors are module distinct from the debugger and must be registered in
order to be active. It can be done before or after starting debugging.

For simplicity, inspector modules should register themselves into debugger core
and do not return anything. So attaching a module is simply a `require` or 
`dofile` call. This violates the *no global side effects* policy of Lua modules,
but for debugging purposes, I think we can live with that :)

# Probing objects
First, we need to know what object we want to inspect. For this, two distinct
modes are available.

##Metatable matching
This matching mode works by associating an inspector function to a given metatable.
It requires you to know in advance what metatables are expected (for example, 
all your *Car* objects share the same metatable).

For this we simply add our inspector function to `debugger.introspection.inspectors`
table with the metatable as key. Your module should look like:

```lua
    local introspection = require "debugger.introspection"
    local function my_inspector(name, value, parent, fullname)
      -- my inspection logic
    end
    
    introspection.inspectors[my_metatable] = my_inspector
```

## Generic probe
Some libraries use a lot of different metatables or create them on-the-fly. In
this situation, it can became tricky to list all possible metatables for a given
object family.

To handle such cases, you can add a probe function that will be called for any
value (table or userdata) when a specific metatable inspector cannot be found.

As you can imagine, this method is munch slower than previous one so do not abuse
this feature by attaching many such probes or making expensive processing on them.

Generic probes are added to debugger with `debugger.introspection.add_probe` 
function. A typical module should look like:

```lua
    local introspection = require "debugger.introspection"
    local function my_inspector(name, value, parent, fullname)
      if is_my_object(value)
        -- my inspection logic
      end
      return nil -- unknown object
    end
    
    introspection.add_probe(my_inspector)
```

# Inspection logic
Now we're able to detect values to inspect, let's generate our properties.
This what inspector functions do.

These functions generate properties that will be sent to IDE with
the `debugger.introspection.property` function. They are called with a value to
inspect and must generate a debugger property for it (and possibly its children
for complex data structures).

Like we saw in previous part, inspector functions always takes 4 parameters and
their return values are defined too.

These arguments are:

* **name** is the property name that appear on the *name* column of debugger
  view. This name is usually given by parent object (that is the inspector that
  called your inspector)
* **value** is the actual value to inspect
* **parent** is the parent property of the value (a debugger data structure, not
  `value`'s parent !)
* **fullname** this is the expression that will be evaluated by the debugger to
  get `value` again (either to query its children or to set it). 

  
## Generating properties
The main task of the inspector is to call `debugger.introspection.property` to
generate a property corresponding to `value`. This function will check if the
value should be sent to IDE, depending on this, it returns:

* A *Property* object if the property have be sent to IDE, in this case you can
  inspect children properties (if any) and return that object to caller
* `nil` if value will not be sent to IDE (too deep recursion for instance).
  In this case, you should not try to inspect children and return a `nil`
  value immediately.

The inspector that is used for most primitive types is simply:

```lua
    local function default_inspector(name, value, parent, fullname)
      return introspection.property(name, type(value), tostring(value), parent, fullname)
    end
```

## Inspecting children properties
Now let's inspect more complex types with child properties. This is done by
either by calling `debugger.introspection.property` more than once if you
want to fully handle children inspection or by calling
`debugger.introspection.inspect` to dispatch an arbitrary value to
appropriate inspector.

As you can imagine, the `parent` of these sub-properties is the object returned
by `debugger.introspection.property`. For `fullname` (the expression used to 
retrieve the value in future calls), you can use 
`debugger.introspection.make_fullname` to generate a valid Lua expression
However, this method works only if your property can be accessed by index.

If the value is retrieved by some other way (like calling a `get_my_prop` function)
there is currently no supported way to handle it, see *Limitations* section).

Let's show an example with a *Car* that have *x*, *y*, *z* and *speed* properties
that we want to expose and some internal *id* that we will use only for string
representation:

```lua
    local function car_inspector(name, value, parent, fullname)
      local prop = introspection.property(name, "Car", "Car #" .. value.id, parent, fullname)
      -- do not inspect children if the parent is not generated
      if not prop then return nil end
      
      -- use regular introspection for x,y,z
      introspection.inspect("x", value.x, prop, introspection.make_fullname(fullname, "x"))
      introspection.inspect("y", value.y, prop, introspection.make_fullname(fullname, "y"))
      introspection.inspect("z", value.z, prop, introspection.make_fullname(fullname, "z"))
      
      -- generate directly speed property
      introspection.property("speed", "Speed", tostring(value.speed), prop, introspection.make_fullname(fullname, "speed"))
      
      return prop
    end
```

# Limitations
As we've seen before, the debugger engine is currently unable to use anything
else than indexation to retrieve values or set values after inspection phase, so
you will be able to use this feature only if your userdata (or table) implements
`__index` metamethod correctly.

For setting data, the debugger makes basically `dostring(fullname .. " = " .. newvalue)`
in a sandboxed environment. So, again, `__newindex` metamethod must be implemented if you
want to modify data.
