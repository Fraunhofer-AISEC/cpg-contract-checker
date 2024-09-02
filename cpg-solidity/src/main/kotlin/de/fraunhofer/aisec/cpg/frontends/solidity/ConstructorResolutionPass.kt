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

import de.fraunhofer.aisec.cpg.TranslationContext
import de.fraunhofer.aisec.cpg.graph.declarations.RecordDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.graph.types.ObjectType
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.*
import de.fraunhofer.aisec.cpg.passes.order.ExecuteBefore

@ExecuteBefore(EvaluationOrderGraphPass::class)
@ExecuteBefore(TypeResolver::class)
class ConstructorResolutionPass(ctx: TranslationContext) : TranslationUnitPass(ctx) {

    override fun accept(result: TranslationUnitDeclaration) {
        val all = SubgraphWalker.flattenAST(result)
        val records = all.filterIsInstance<RecordDeclaration>()
        val calls = all.filterIsInstance<CallExpression>()

        calls.forEach {
            val call = it
            val record = records.filter { it.name.lastPartsMatch(call.name) }.firstOrNull()
            record?.let {
                call.type =
                    ObjectType(
                        record.name.toString(),
                        listOf(),
                        false,
                        call.language
                    ) // TypeHandler.getAddressType(call.language,call.ctx!!)
            }
        }
    }

    override fun cleanup() {}
}
