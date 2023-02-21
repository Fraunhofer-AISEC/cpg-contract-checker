package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Require
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Revert
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.SpecifiedExpression
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.statements.expressions.*
import de.fraunhofer.aisec.cpg.graph.types.ObjectType
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.ParseTree
import org.antlr.v4.runtime.tree.TerminalNode
import org.parboiled.common.ImmutableList
import org.slf4j.LoggerFactory

class ExpressionHandler(lang: SolidityLanguageFrontend) : Handler<Expression, ParserRuleContext, SolidityLanguageFrontend>(
    ::Expression, lang) {

    private var replacingReferenceWithExpression: Boolean = false

    private val baseTypes: MutableSet<String> = mutableSetOf<String>("bool", "int", "uint","fixed", "ufixed", "address", " address payable", "bytes", "string")


    private val logger = LoggerFactory.getLogger(ExpressionHandler::class.java)

    init {
        map.put(SolidityParser.ExpressionContext::class.java) { handleExpression(it as SolidityParser.ExpressionContext) }
        map.put(SolidityParser.PrimaryExpressionContext::class.java) { handlePrimaryExpression(it as SolidityParser.PrimaryExpressionContext) }
        map.put(SolidityParser.FunctionCallContext::class.java) { handleFunctionCall(it as SolidityParser.FunctionCallContext) }
        map.put(SolidityParser.NameValueListContext::class.java) {handleNameValueListExpression(it as SolidityParser.NameValueListContext)}
        map.put(SolidityParser.IdentifierContext::class.java) {handleIdentifier(it as SolidityParser.IdentifierContext)}

        // Adding all signed and unsigned integer type strings
        for (i in 8..256 step 8){
            baseTypes.addAll(setOf("uint$i", "int$i"))
        }
    }

    private fun isType(type: String): Boolean {
        var name = type
        while(type.endsWith("]")){
            name = type.substring(type.lastIndexOf('['))
        }

        if(name in baseTypes)
            return true;
        if(name.startsWith("uint")){
            name.substring(4).toIntOrNull()?.let {
                return (8..256 step 8).contains(it)
            }
        }
        if(name.startsWith("int")){
            name.substring(3).toIntOrNull()?.let {
                return (8..256 step 8).contains(it)
            }
        }

        if(name.startsWith("bytes")){
            name.substring(5).toIntOrNull()?.let {
                return (1..32).contains(it)
            }
        }

        if(name.startsWith("fixed")){
            name.substring(5)?.let {
                val comps = it.split("x")
                if(comps.size == 2  && (8..256 step 8).contains(comps[0].toIntOrNull()) && (0..80).contains(comps[1].toIntOrNull())){
                    return true
                }
            }
        }

        if(name.startsWith("ufixed")){
            name.substring(6)?.let {
                val comps = it.split("x")
                if(comps.size == 2  && (8..256 step 8).contains(comps[0].toIntOrNull()) && (0..80).contains(comps[1].toIntOrNull())){
                    return true
                }
            }
        }
        return false;
    }

    private fun handleNameValueListExpression(ctx: SolidityParser.NameValueListContext): Expression {
        val exp = NodeBuilder.newExpressionList(lang.getCodeFromRawNode(ctx))

        for(nameValue in ctx.nameValue()){
            val keyValue = KeyValueExpression()
            keyValue.key = handle(nameValue.identifier())
            keyValue.value = handle(nameValue.expression())
            exp.addExpression(keyValue)
        }
        return exp
    }

    private fun handleExpression(ctx: SolidityParser.ExpressionContext): Expression {
        val expressions = ctx.expression()

        // a primary expression, e.g. a reference or a literal
        ctx.primaryExpression()?.let {
            return this.handle(it)
        }

        // check for an operator
        val terminalNodes:List<ParseTree> = ctx.children.filter { it is TerminalNode }
        val op = terminalNodes.get(0)

        // member access
        if(op != null && op.text == ".") {
            val base = this.handle(expressions.first())
            val name = ctx.identifier().text

            val member = NodeBuilder.newMemberExpression(base, UnknownType.getUnknownType(), name, op.text, this.lang.getCodeFromRawNode(ctx))

            return member
        }

        if(terminalNodes.size == 2 && "[".equals(terminalNodes[0].text) && "]".equals(terminalNodes[1].text)){
            val arraySub = NodeBuilder.newArraySubscriptionExpression(lang.getCodeFromRawNode(ctx))
            arraySub.arrayExpression = this.handle(expressions[0])
            arraySub.subscriptExpression = this.handle(expressions[1])

            return arraySub
        }

        if(terminalNodes.size == 2 && "?".equals(terminalNodes[0].text) && ":".equals(terminalNodes[1].text)){
            return NodeBuilder.newConditionalExpression(
                this.handle(expressions[0]), this.handle(expressions[1]), this.handle(expressions[2]),
                TypeParser.createFrom(TypeParser.UNKNOWN_TYPE_STRING,false));
        }

        if(terminalNodes.size == 3 && "[".equals(terminalNodes[0].text)  && ":".equals(terminalNodes[1].text) && "]".equals(terminalNodes[2])){
            return NodeBuilder.newArrayRangeExpression(
                this.handle(expressions[0]),this.handle(expressions[1]),lang.getCodeFromRawNode(ctx))
        }

        // either a function call or a construct expression
        if(ctx.functionCallArguments() != null) {
            var ref = this.handle(ctx.expression().firstOrNull())


            if(ref is DeclaredReferenceExpression || ref is SpecifiedExpression){
                var name: String? = null;
                var fqn: String? = null;
                if(ref is DeclaredReferenceExpression){
                    name = ref.name
                    fqn = name
                }else if(ref is SpecifiedExpression){
                    var nameHolder = ref
                    while(nameHolder is SpecifiedExpression){
                        nameHolder = nameHolder.expression
                    }
                    name = nameHolder.name
                    fqn = name
                }

                var call:CallExpression = CallExpression()

                name?.let {
                    fqn?.let {
                        // TODO: use the scope manager instead
                        val record = this.lang.scopeManager.currentRecord?.records?.firstOrNull { it.name == name }

                        call = if(record != null) {
                            NodeBuilder.newConstructExpression(this.lang.getCodeFromRawNode(ctx))
                        } else {
                            NodeBuilder.newCallExpression(name, fqn, this.lang.getCodeFromRawNode(ctx), false)
                        }

                        for(arg in ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()) {
                            call.addArgument(this.handle(arg))
                        }

                        if(call.name.equals("revert") && call.arguments.size == 1 && call.arguments[0] is Literal<*>){
                            val revertStatement: Revert = Revert()
                            revertStatement.message = call.arguments[0]
                            return revertStatement
                        }

                        if(call.name.equals("require") && call.arguments.size >= 1  && call.arguments.size <= 2){
                            val require: Require = Require()
                            require.condition = call.arguments[0]
                            if(call.arguments.size > 2){
                                require.message = call.arguments[1]
                            }
                            return require
                        }
                    }
                }
                var base = expressions.first()
                while (base.nameValueList() != null) {
                    base = base.expression().first()
                }
                if(base.expression().isNotEmpty()){
                    call.setBase(this.handle(expressions.first().expression()[0]))
                }

                return call
            }else if(ref is CallExpression){
                return ref
            }else if(isType(ref.code?:"") || lang.declaredTypes.contains(ref.code?:"")){
            var cast = NodeBuilder.newCastExpression(this.lang.getCodeFromRawNode(ctx))
                val args =ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()
                if(args.size == 1){
                    cast.expression = this.handle(args[0])
                    cast.castType = ObjectType(
                        ref.code,
                        Type.Storage.AUTO,
                        Type.Qualifier(false,false,false,false),
                        listOf(),
                        ObjectType.Modifier.NOT_APPLICABLE,
                        !lang.declaredTypes.contains(ref.code?:""))
                    return cast
                }
            }

            logger.warn("Expression {} could not be parsed.", ctx::class.java)

            return Expression()
        }

        if(ctx.nameValueList() != null){
            val exp = this.handle(ctx.expression().firstOrNull())

            val specExpression = SpecifiedExpression()

            specExpression.expression = exp

            specExpression.specifiers = this.handle(ctx.nameValueList()!!) as ExpressionList

            return specExpression
        }

        // unary expression
        if(op != null && expressions.size == 1) {
            val postfix = ctx.children.lastOrNull() is TerminalNode
            val prefix = ctx.children.firstOrNull() is TerminalNode

            val unary = NodeBuilder.newUnaryOperator(op.text, postfix, prefix, this.lang.getCodeFromRawNode(ctx))

            unary.input = this.handle(expressions[0])

            return unary
        }

        // binary expression
        if(op != null && expressions.size == 2) {
            val binOp = NodeBuilder.newBinaryOperator(op.text, this.lang.getCodeFromRawNode(ctx))

            binOp.lhs = this.handle(expressions[0])
            binOp.rhs = this.handle(expressions[1])

            return binOp
        }


        logger.warn("Expression {} could not be parsed.", ctx::class.java)

        return Expression()
    }

    private fun handleFunctionCall(ctx: SolidityParser.FunctionCallContext): CallExpression {
        val call: CallExpression = CallExpression()

        // either a function call or a construct expression
        if (ctx.functionCallArguments() != null) {
            val ref = this.handle(ctx.expression())

            if (ref is DeclaredReferenceExpression) {
                val name = ref.name
                val fqn = name

                // TODO: use the scope manager instead
                val record = this.lang.scopeManager.currentRecord?.records?.firstOrNull { it.name == name }

                val call = if (record != null) {
                    NodeBuilder.newConstructExpression(this.lang.getCodeFromRawNode(ctx))
                } else {
                    NodeBuilder.newCallExpression(ref.name, fqn, this.lang.getCodeFromRawNode(ctx), false)
                }

                for (arg in ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()) {
                    call.addArgument(this.handle(arg))
                }

                return call
            }
        }
        return call
    }

    private fun handleIdentifier(ctx: SolidityParser.IdentifierContext) : Expression {
        val name = ctx.text
        // replacing identifier to reference conversion by replacing them with the expression in the modifier invocation
        // != null represents the case where the modifier is the actual base function
        if(!replacingReferenceWithExpression && lang.currentIdentifierMapStack.isNotEmpty() && lang.currentIdentifierMapStack.peek() != null){
            replacingReferenceWithExpression = true
            val expression: SolidityParser.ExpressionContext? = getExpressionMatchingIdentifier(lang.currentIdentifierMapStack.peek(), name)

            if(expression != null){
                val cpgExpression = handle(expression)
                replacingReferenceWithExpression = false
                return cpgExpression
            }
            replacingReferenceWithExpression = false
        }

        val ref = NodeBuilder.newDeclaredReferenceExpression(name,
            UnknownType.getUnknownType(),
            this.lang.getCodeFromRawNode(ctx))
        return ref
    }

    private fun getExpressionMatchingIdentifier(map: MutableMap<String, SolidityParser.ExpressionContext>, name: String): SolidityParser.ExpressionContext?{
        map?.let {
            return map[name]
        }
        return null
    }

    private fun handlePrimaryExpression(ctx: SolidityParser.PrimaryExpressionContext): Expression {
        ctx.identifier()?.let {
            //if(it.text == "_" && lang.modifierStack.isNotEmpty()){
            //    println("Found wildcard in modifier step")
            //}else {
            //}
            return handle(it)
        }

        ctx.numberLiteral()?.let {

            it.DecimalNumber()?.text?.let {
                val value = it.toIntOrNull() ?: it.toLongOrNull() ?: it.toDoubleOrNull() ?: null
                val type = when(value){
                    is Int -> TypeParser.createFrom("int", false)
                    is Long -> TypeParser.createFrom("long", false)
                    is Double -> TypeParser.createFrom("double", false)
                    else -> UnknownType.getUnknownType()
                }
                return NodeBuilder.newLiteral(value, type, this.lang.getCodeFromRawNode(ctx.numberLiteral()))
            }

            it.HexNumber()?.text.let {
                return NodeBuilder.newLiteral(it, TypeParser.createFrom("", true), it)
            }

            val value = Integer.valueOf(it.DecimalNumber().text)
            val literal = NodeBuilder.newLiteral(value,
                TypeParser.createFrom("int", false),
                this.lang.getCodeFromRawNode(it)
            )
            
            return literal
        }

        ctx.BooleanLiteral()?.let {
            val value = when(it.text){
                "true" -> true
                else -> false
            }
            return NodeBuilder.newLiteral<Boolean>(value, TypeParser.createFrom("bool", true), it.text)
        }

        ctx.stringLiteral()?.let {
            return NodeBuilder.newLiteral(it.text, TypeParser.createFrom("string", true), it.text)
        }


        ctx.tupleExpression()?.let {

        }

        ctx.PayableKeyword()?.let {

        }

        ctx.TypeKeyword()?.let {

        }

        ctx.typeNameExpression()?.let {

        }

        return Expression()
    }
}