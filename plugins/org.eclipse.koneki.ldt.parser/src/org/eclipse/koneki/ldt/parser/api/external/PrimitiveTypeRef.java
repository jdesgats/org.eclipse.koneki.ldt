/*******************************************************************************
 * Copyright (c) 2011 Sierra Wireless and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Sierra Wireless - initial API and implementation
 *******************************************************************************/
package org.eclipse.koneki.ldt.parser.api.external;

/**
 * Reference of a type defines in this module
 */
public class PrimitiveTypeRef extends TypeRef {
	private String typeName;

	public PrimitiveTypeRef(String typeName) {
		this.typeName = typeName;
	}

}
