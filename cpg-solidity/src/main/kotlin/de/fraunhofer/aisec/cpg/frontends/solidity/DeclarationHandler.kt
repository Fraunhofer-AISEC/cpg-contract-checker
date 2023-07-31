package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.ModifierDefinition
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.PragmaDeclaration
import de.fraunhofer.aisec.cpg.graph.*
import de.fraunhofer.aisec.cpg.graph.declarations.*
import de.fraunhofer.aisec.cpg.graph.statements.CompoundStatement
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.BinaryOperator
import de.fraunhofer.aisec.cpg.graph.statements.expressions.DeclaredReferenceExpression
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.helpers.Util
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory
import java.util.*
import java.util.function.Supplier

class DeclarationHandler(lang: SolidityLanguageFrontend) : Handler<Declaration, ParserRuleContext, SolidityLanguageFrontend>(
    Supplier { ProblemDeclaration() }, lang) {

    private val logger = LoggerFactory.getLogger(DeclarationHandler::class.java)

    var methodId = 0

    init {
        map.put(SolidityParser.ContractDefinitionContext::class.java) { handleContractDefinition(it as SolidityParser.ContractDefinitionContext) }
        map.put(SolidityParser.FunctionDefinitionContext::class.java) { handleFunctionDefinition(it as SolidityParser.FunctionDefinitionContext) }
        map.put(SolidityParser.ParameterContext::class.java) { handleParameter(it as SolidityParser.ParameterContext) }
        map.put(SolidityParser.StateVariableDeclarationContext::class.java) { handleStateVariableDeclaration(it as SolidityParser.StateVariableDeclarationContext) }
        map.put(SolidityParser.VariableDeclarationContext::class.java) { handleVariableDeclaration(it as SolidityParser.VariableDeclarationContext) }
        map.put(SolidityParser.StructDefinitionContext::class.java) { handleStructDefinition(it as SolidityParser.StructDefinitionContext) }
        map.put(SolidityParser.ModifierDefinitionContext::class.java) { handleModifierDefinition(it as SolidityParser.ModifierDefinitionContext) }
        // map.put(SolidityParser.PragmaDirectiveContext::class.java) {handlePragmaDirectiveContext(it as SolidityParser.PragmaDirectiveContext)}
    }

    private fun handlePragmaDirectiveContext(ctx: SolidityParser.PragmaDirectiveContext): Declaration {
        val d:PragmaDeclaration = PragmaDeclaration()
        d.applyMetadata(this, ctx.pragmaName().text, ctx, ctx.text)
        ctx.pragmaValue()?.version()?.let {

            for( versionC in it.versionConstraint()){
                val b = BinaryOperator()
                b.operatorCode = "="
                versionC.versionOperator()?.let { b.operatorCode = it.text }
                // Capture ^ under ==
                versionC.VersionLiteral()?.let { b.rhs =  newLiteral(it.text, TypeParser.createFrom("string", true, frontend), it.text) } // Todo here there is an issue
                versionC.DecimalNumber()?.let { b.rhs =  newLiteral(it.text, TypeParser.createFrom("string", true, frontend), it.text) }
                newDeclaredReferenceExpression("version",
                    UnknownType.getUnknownType(language),
                    frontend.getCodeFromRawNode(ctx))

                d.expressions.add(b)
            }

        }

        return d
    }

    private fun handleStructDefinition(ctx: SolidityParser.StructDefinitionContext): Declaration {
        val name = ctx.identifier()?.text?:""

        val record = newRecordDeclaration(name, "struct", frontend.getCodeFromRawNode(ctx))
        frontend.declaredTypes.put(name, record)

        frontend.scopeManager.enterScope(record)

        for(`var` in ctx.variableDeclaration() ?: listOf()) {
            val declaration = handle(`var`)

            frontend.scopeManager.addDeclaration(declaration)
        }

        frontend.scopeManager.leaveScope(record)

        return record
    }

    private fun handleParameter(ctx: SolidityParser.ParameterContext): ParamVariableDeclaration {
        val name = ctx.identifier()?.text ?: ""
        var type: Type = UnknownType.getUnknownType(language)
        ctx.typeName()?.let { type = frontend.typeHandler.handle(it)?:UnknownType.getUnknownType(language) }

        val param = newParamVariableDeclaration(name,
            type,
            false,
            frontend.getCodeFromRawNode(ctx)
        )

        return param
    }

    private fun handleContractDefinition(ctx: SolidityParser.ContractDefinitionContext): RecordDeclaration {
        val record = newRecordDeclaration(
            ctx.identifier().text,
            "contract",
            frontend.getCodeFromRawNode(ctx))

        frontend.declaredTypes.put(record.name.toString(), record)

        // enter the record scope
        frontend.scopeManager.enterScope(record)

        for(part in ctx.contractPart()) {
            var declaration: Declaration? = null

            part.functionDefinition()?.let {
                declaration = handle(part.functionDefinition())
            }

            part.stateVariableDeclaration()?.let {
                declaration = handle(part.stateVariableDeclaration())
            }

            part.structDefinition()?.let {
                declaration = handle(part.structDefinition())
            }

            part.modifierDefinition()?.let{
                declaration = handle(part.modifierDefinition())
            }

            // add the declaration
            declaration?.let { frontend.scopeManager.addDeclaration(declaration) }
        }

        // leave the record scope
        frontend.scopeManager.leaveScope(record)

        return record
    }

    public fun handleMissingContractDefinition(filename: String, unit: SolidityParser.SourceUnitContext): RecordDeclaration {
        val record = newRecordDeclaration(
            "Contract" + filename.subSequence(0, filename.indexOf(".")),
            "contract",
            frontend.getCodeFromRawNode(unit))

        frontend.declaredTypes.put(record.name.toString(), record)

        // enter the record scope
        frontend.scopeManager.enterScope(record)

        for(part in unit.contractPart()) {
            var declaration: Declaration? = null

            part.functionDefinition()?.let {
                declaration = handle(it)
            }

            part.stateVariableDeclaration()?.let {
                declaration = handle(it)
            }

            part.structDefinition()?.let {
                declaration = handle(it)
            }

            part.modifierDefinition()?.let{
                declaration = handle(it)
            }

            // add the declaration
            declaration?.let { frontend.scopeManager.addDeclaration(declaration) }
        }

        if(unit.block() != null || unit.statement() != null){
            frontend.scopeManager.addDeclaration(handleMissingFunctionDefinition(filename, unit))
        }

        // leave the record scope
        frontend.scopeManager.leaveScope(record)

        return record
    }

    private fun handleModifierDefinition(ctx: SolidityParser.ModifierDefinitionContext): ModifierDefinition {
        val desc = ctx.identifier()

        val record = frontend.scopeManager.currentRecord

        val modifier = ModifierDefinition()
        modifier.applyMetadata(this, desc.text, ctx, ctx.text)
        record?.let {
            modifier.recordDeclaration = record
        }

        // enter function scope
        frontend.scopeManager.enterScope(modifier)

        // handle body
        modifier.body = frontend.statementHandler.handle(ctx.block())

        ctx.parameterList()?.let {
            for(param in it.parameter()) {
                val decl = frontend.declarationHandler.handle(param)

                frontend.scopeManager.addDeclaration(decl)
            }
        }

        ctx.VirtualKeyword()?.let {
            // Todo Add to modifiers
        }

        ctx.overrideSpecifier().let {
            // Todo Add to modifiers
        }

        val recordType = if(record != null) {
            TypeParser.createFrom(record.name.toString(), false, frontend)
        } else {
            UnknownType.getUnknownType(language)
        }

        // create the this receiver
        val receiver = newVariableDeclaration(
            "this",
            recordType,
            frontend.getCodeFromRawNode(ctx), false)

        modifier.receiver = receiver

        // leave function scope
        frontend.scopeManager.leaveScope(modifier)

        (frontend as SolidityLanguageFrontend).let {
            it.modifierMap[modifier] = ctx
        }

        return modifier
    }

    private fun handleFunctionDefinition(ctx: SolidityParser.FunctionDefinitionContext): MethodDeclaration {
        val desc = ctx.functionDescriptor()
        val modifierInvocationIdentifiers = mutableListOf<String>()

        ctx.modifierList()?.modifierInvocation()?.let{
            it.forEach { modifierInvocationIdentifiers.add(it.identifier().text?: "") }
        }

        val record = frontend.scopeManager.currentRecord

        val method = if(desc.ConstructorKeyword() != null || record != null && desc.identifier() != null && desc.identifier().text.equals(record.name.toString())) {
            newConstructorDeclaration(
                record?.name ?: "",
                frontend.getCodeFromRawNode(ctx),
                record
            )
        } else {
            newMethodDeclaration(
                desc.identifier()?.text ?: "",
                frontend.getCodeFromRawNode(ctx),
                false,
                record
            )
        }

        // enter function scope
        frontend.scopeManager.enterScope(method)


        ctx.parameterList()?.let {
            for(param in it.parameter()) {
                val decl = frontend.declarationHandler.handle(param)

                frontend.scopeManager.addDeclaration(decl)
            }
        }

        // TODO: parse more than one return parameter
        ctx.returnParameters()?.parameterList()?.parameter()?.firstOrNull()?.let {
            frontend.typeHandler.handle(it.typeName())?.let { method.type = it }
        }

        ctx.modifierList()?.let {
            it.ExternalKeyword()?.let{
                // Todo this and more keywords
            }
        }

        val recordType = if(record != null) {
            TypeParser.createFrom(record.name.toString(), false, frontend)
        } else {
            UnknownType.getUnknownType(language)
        }

        // create the this receiver
        val receiver = newVariableDeclaration(
            "this",
            recordType,
            frontend.getCodeFromRawNode(ctx), false)

        method.receiver = receiver

        if(modifierInvocationIdentifiers.isEmpty()){
            // handle body, if the function has modifiers, the handling of the block is done when we for sure know all modifiers
            ctx.block()?.let { method.body = frontend.statementHandler.handle(it) }
        }else{
            (frontend).let {
                it.functionsWithModifiers[ctx] = method
            }
        }

        // leave function scope
        frontend.scopeManager.leaveScope(method)

        return method
    }

    private fun handleMissingFunctionDefinition(filename: String, unit: SolidityParser.SourceUnitContext): MethodDeclaration {

        val record = frontend.scopeManager.currentRecord

        val method =
            newMethodDeclaration(
                "function_" + filename,
                frontend.getCodeFromRawNode(unit),
                false,
                record
            )

        // enter function scope
        frontend.scopeManager.enterScope(method)


        method.type = UnknownType.getUnknownType(language)



        val recordType = if(record != null) {
            TypeParser.createFrom(record.name.toString(), false, frontend)
        } else {
            UnknownType.getUnknownType(language)
        }

        // create the this receiver
        val receiver = newVariableDeclaration(
            "this",
            recordType,
            frontend.getCodeFromRawNode(unit), false)

        method.receiver = receiver

        if(unit.block()!= null){
            method.body = frontend.statementHandler.handle(unit.block())
        }else if(unit.statement() != null){
            method.body = frontend.statementHandler.handleMissingBlock(unit)
        }

        // leave function scope
        frontend.scopeManager.leaveScope(method)

        return method
    }

    public fun handleModifierExpansion(ctx: SolidityParser.FunctionDefinitionContext, method: MethodDeclaration){
        // Todo implement expansion of modifiers
        // Todo replace with modifier expansion routine and delay until all modifiers were found
        frontend.modifierStack.clear()
        frontend.currentIdentifierMapStack.clear()
        frontend.modifierStack.push(ctx)

        ctx.modifierList()?.modifierInvocation()?.let{

            it.asReversed().forEach {
                val name = it.identifier().text?: ""
                val modifierInvocation = it
                frontend.modifierMap.values.filter { it.identifier().text == name }.filter { it.block() != null }.firstOrNull()?.let {
                    frontend.modifierStack.push( it )

                    val modifier = frontend.modifierStack.peek() as SolidityParser.ModifierDefinitionContext
                    frontend.modifierIdentifierMap.put(modifier, mutableMapOf())
                    modifierInvocation.expressionList()?.let {
                        val expressions = it.children.filterIsInstance<SolidityParser.ExpressionContext>()
                        val parameters = modifier.parameterList().children.filterIsInstance<SolidityParser.ParameterContext>()
                        for ( i in 0 until expressions.size){
                            frontend.modifierIdentifierMap[modifier]!![parameters[i].identifier().text] = expressions[i]
                        }
                    }
                }
            }
        }

        frontend.scopeManager.enterScope(method)
        ctx.block()?.let { method.body = frontend.statementHandler.handle(it) }
        val modifier = frontend.modifierStack.pop()
        frontend.currentIdentifierMapStack.push(frontend.modifierIdentifierMap[modifier])
        method.body = expandBodyWithModifiers(modifier)

        SubgraphWalker.flattenAST(method.body).forEach { it.comment = it.comment?: "" + methodId }
        methodId++

        frontend.modifierStack.push(modifier)
        frontend.currentIdentifierMapStack.pop()
        frontend.scopeManager.leaveScope(method)
    }

    public fun expandBodyWithModifiers(modifierOrFunction: ParserRuleContext): Statement {
        if(modifierOrFunction is SolidityParser.FunctionDefinitionContext){
            return frontend.statementHandler.handle(modifierOrFunction.block())!!
        }else if(modifierOrFunction is SolidityParser.ModifierDefinitionContext){
            // Todo handle parameters and handle modifier body
            val block = frontend.statementHandler.handle(modifierOrFunction.block())
            (block as CompoundStatement).let {
                // Todo Indexed Prepend of statement
            }
            return block
        }else {
            log.error("Non modifier or function was provided during modifier expansion")
        }
        return newProblemExpression("Body expansion failed", ProblemNode.ProblemType.TRANSLATION, )
    }

    private fun handleStateVariableDeclaration(ctx: SolidityParser.StateVariableDeclarationContext): Declaration {
        val name = ctx.identifier().Identifier()?.text?: ctx.identifier().text
        var type: Type = UnknownType.getUnknownType(language)
        ctx.typeName()?.let {type =  frontend.typeHandler.handle(it)?: UnknownType.getUnknownType(language) }

        var initializer: Expression? = null
        ctx.expression()?.let {
            initializer = frontend.expressionHandler.handle(it)
        }

        val field = newFieldDeclaration(name,
            type,
            listOf(),
            frontend.getCodeFromRawNode(ctx),
            frontend.getLocationFromRawNode(ctx),
            initializer,
            false)

        return field
    }

    private fun handleVariableDeclaration(ctx: SolidityParser.VariableDeclarationContext): FieldDeclaration {
        val name = ctx.identifier()?.Identifier()?.text ?: ""
        var type: Type = UnknownType.getUnknownType(language)
        ctx.typeName()?.let {type =  frontend.typeHandler.handle(it)?: UnknownType.getUnknownType(language) }

        val field = newFieldDeclaration(name,
            type,
            listOf(),
            frontend.getCodeFromRawNode(ctx),
            frontend.getLocationFromRawNode(ctx),
            null,
            false)

        return field
    }
}