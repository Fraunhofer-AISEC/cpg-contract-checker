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

import de.fraunhofer.aisec.cpg.frontends.HasShortCircuitOperators
import de.fraunhofer.aisec.cpg.frontends.HasStructs
import de.fraunhofer.aisec.cpg.frontends.Language
import de.fraunhofer.aisec.cpg.graph.types.*
import org.neo4j.ogm.annotation.Transient

class SolidityLanguage :
    Language<SolidityLanguageFrontend>(), HasShortCircuitOperators, HasStructs {

    @Transient override val frontend = SolidityLanguageFrontend::class
    override val conjunctiveOperators = listOf("&&")
    override val disjunctiveOperators = listOf("||")
    override val compoundAssignmentOperators: Set<String> =
        setOf("+=", "-=", "*=", "/=", "%=", "<<=", ">>=", "&=", "|=", "^=")
    override val fileExtensions: List<String> = listOf("sol")
    override val namespaceDelimiter: String = "."
    @Transient override val builtInTypes: Map<String, Type>

    init {
        val types =
            mutableMapOf(
                "address" to NumericType("address", 20 * 8, this, NumericType.Modifier.UNSIGNED),
                "bool" to BooleanType("bool", language = this),
                "string" to StringType("string", this),
                "byte" to NumericType("byte", 8, this, NumericType.Modifier.UNSIGNED),
                "int" to IntegerType("int256", 256, this, NumericType.Modifier.SIGNED),
                "uint" to IntegerType("uint256", 256, this, NumericType.Modifier.UNSIGNED),
                "fixed" to NumericType("fixed128x18", 128, this, NumericType.Modifier.SIGNED),
                "ufixed" to NumericType("ufixed128x18", 128, this, NumericType.Modifier.UNSIGNED),
                "bytes" to
                    StringType(
                        "bytes",
                        this
                    ), // need to see if we can find a better option to represent a dynamical
                // array of bytes
            )
        for (i in 8..256 step 8) types.put(
            "int" + i,
            IntegerType("int" + i, i, this, NumericType.Modifier.SIGNED)
        )

        for (i in 8..256 step 8) types.put(
            "uint" + i,
            IntegerType("uint" + i, i, this, NumericType.Modifier.UNSIGNED)
        )
        for (i in 1..32) types.put(
            "bytes" + i,
            NumericType("bytes" + i, i, this, NumericType.Modifier.UNSIGNED)
        )

        builtInTypes = types
    }
}
