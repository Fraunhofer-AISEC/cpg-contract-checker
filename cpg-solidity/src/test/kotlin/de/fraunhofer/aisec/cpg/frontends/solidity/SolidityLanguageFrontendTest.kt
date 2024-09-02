/*
 * Copyright (c) 2024, Fraunhofer AISEC. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ╔═╗╔═╗╔═╗   ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┌─┐┌┬┐  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐
 * ║  ╠═╝║ ╦───║  │ ││││ │ ├┬┘├─┤│   │───║  ├─┤├┤ │  ├┴┐├┤ ├┬┘
 * ╚═╝╩  ╚═╝   ╚═╝└─┘┘└┘ ┴ ┴└─┴ ┴└─┘ ┴   ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─
 *
 */
package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.graph.declarations.RecordDeclaration
import de.fraunhofer.aisec.cpg.graph.statements.expressions.BinaryOperator
import de.fraunhofer.aisec.cpg.graph.statements.expressions.DeclaredReferenceExpression
import java.nio.file.Path
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertSame
import org.junit.jupiter.api.Test

class SolidityLanguageFrontendTest {
    @Test
    fun testFrontend() {
        val topLevel = Path.of("src", "test", "resources")
        val tu =
            TestUtils.analyzeAndGetFirstTU(
                listOf(topLevel.resolve("storage.sol").toFile()),
                topLevel,
                true
            ) {
                it.registerLanguage<SolidityLanguage>()
            }
        assertNotNull(tu)

        val storage =
            tu.getDeclarationsByName("Storage", RecordDeclaration::class.java).iterator().next()
        assertNotNull(storage)

        val fields = storage.fields
        assertNotNull(fields)

        assertEquals(1, fields.size)

        val data = fields.first()
        assertNotNull(data)
        // assertEquals(TypeParser.createFrom("uint", false), data.type)
        assertEquals("Storage.data", data.name.toString())

        val methods = storage.methods
        assertNotNull(methods)
        assertEquals(2, methods.size)

        val set = methods.firstOrNull { it.name.toString().equals("Storage.set") }
        assertNotNull(set)

        val x = set.parameters.firstOrNull()
        assertNotNull(x)

        val binOp = set.getBodyStatementAs(0, BinaryOperator::class.java)
        assertNotNull(binOp)

        assertSame(data, (binOp.lhs as? DeclaredReferenceExpression)?.refersTo)
        assertSame(x, (binOp.rhs as? DeclaredReferenceExpression)?.refersTo)

        val get = methods.firstOrNull { it.name.toString().equals("Storage.get") }
        assertNotNull(get)
        // assertEquals(TypeParser.createFrom("uint", false), get.type)
    }
}
