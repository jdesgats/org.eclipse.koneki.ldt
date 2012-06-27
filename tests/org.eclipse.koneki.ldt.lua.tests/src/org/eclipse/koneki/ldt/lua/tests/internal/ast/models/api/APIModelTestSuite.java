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

import junit.framework.TestCase;

import org.eclipse.core.runtime.IPath;
import org.eclipse.koneki.ldt.lua.tests.internal.utils.AbstractLuaTestSuite;
import org.eclipse.koneki.ldt.lua.tests.internal.utils.ModelTestCase;

public class APIModelTestSuite extends AbstractLuaTestSuite {

	public APIModelTestSuite(boolean ignore) {
		super("apimodel", "tests/apimodel", "serialized", ignore); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
	}

	@Override
	protected TestCase createTestCase(final String testName, final String testModuleName, final IPath source, final IPath ref, final List<String> path) {
		return new ModelTestCase(testName, testModuleName, source, ref, path);
	}

	protected String getInputFolderPath() {
		return "lua"; //$NON-NLS-1$
	}

	protected String getReferenceFolderPath() {
		return "model"; //$NON-NLS-1$
	}

	@Override
	protected List<String> createTestBlacklist() {
		final List<String> blacklist = new ArrayList<String>(3);
		blacklist.add("usage/module.lua"); //$NON-NLS-1$
		blacklist.add("usage/module2.lua"); //$NON-NLS-1$
		blacklist.add("usage/function.lua"); //$NON-NLS-1$
		blacklist.add("usage/function2.lua"); //$NON-NLS-1$
		blacklist.add("usage/type.lua"); //$NON-NLS-1$
		blacklist.add("usage/type2.lua"); //$NON-NLS-1$
		return blacklist;
	}
}
