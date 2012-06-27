/*******************************************************************************
 * Copyright (c) 2012 Sierra Wireless and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Sierra Wireless - initial API and implementation
 *******************************************************************************/
package org.eclipse.koneki.ldt.lua.tests.internal.ast.models.api;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.koneki.ldt.lua.tests.internal.utils.AbstractLuaTestSuite;

public class APIModelToHTMLTestSuite extends AbstractLuaTestSuite {

	public APIModelToHTMLTestSuite(boolean ignore) {
		super("apimodeltohtml", "tests/apimodel", "html", ignore); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
	}

	protected String getTestModuleName() {
		return "testhtml"; //$NON-NLS-1$
	}

	protected String getInputFolderPath() {
		return "model"; //$NON-NLS-1$
	}

	protected String getReferenceFolderPath() {
		return "html"; //$NON-NLS-1$
	}

	@Override
	protected List<String> createTestBlacklist() {
		final ArrayList<String> blacklist = new ArrayList<String>();
		blacklist.add("global/field.serialized"); //$NON-NLS-1$
		blacklist.add("global/typedfield.serialized"); //$NON-NLS-1$
		blacklist.add("function/empty.serialized"); //$NON-NLS-1$
		blacklist.add("function/describedreturn.serialized"); //$NON-NLS-1$
		blacklist.add("function/typedreturn.serialized"); //$NON-NLS-1$
		blacklist.add("function/describedtypedreturn.serialized"); //$NON-NLS-1$
		blacklist.add("function/typedparam.serialized"); //$NON-NLS-1$
		blacklist.add("function/describedparam.serialized"); //$NON-NLS-1$
		blacklist.add("function/describedtypedparam.serialized"); //$NON-NLS-1$
		blacklist.add("type/inlinetypedfield.serialized"); //$NON-NLS-1$
		blacklist.add("type/field.serialized"); //$NON-NLS-1$
		blacklist.add("type/typedfield.serialized"); //$NON-NLS-1$
		blacklist.add("type/inlinefield.serialized"); //$NON-NLS-1$
		blacklist.add("type/empty.serialized"); //$NON-NLS-1$
		blacklist.add("type/inlinedescribedtypedfield.serialized"); //$NON-NLS-1$
		blacklist.add("typref/primitive.serialized"); //$NON-NLS-1$
		blacklist.add("typref/internal.serialized"); //$NON-NLS-1$
		blacklist.add("typref/external.serialized"); //$NON-NLS-1$
		blacklist.add("module/shortlongdescription2.serialized"); //$NON-NLS-1$
		blacklist.add("usage/module.serialized"); //$NON-NLS-1$
		blacklist.add("usage/module2.serialized"); //$NON-NLS-1$
		blacklist.add("usage/field.serialized"); //$NON-NLS-1$
		blacklist.add("usage/field2.serialized"); //$NON-NLS-1$
		blacklist.add("usage/function.serialized"); //$NON-NLS-1$
		blacklist.add("usage/function2.serialized"); //$NON-NLS-1$
		blacklist.add("usage/type.serialized"); //$NON-NLS-1$
		blacklist.add("usage/type2.serialized"); //$NON-NLS-1$
		return blacklist;
	}

}