package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory

class TypeHandler(lang: SolidityLanguageFrontend) : Handler<Type, ParserRuleContext, SolidityLanguageFrontend>({ UnknownType.getUnknownType() }, lang) {

    private val logger = LoggerFactory.getLogger(TypeHandler::class.java)

    init {
        map.put(SolidityParser.TypeNameContext::class.java) { handleTypeName(it as SolidityParser.TypeNameContext) }
    }

    private fun handleTypeName(ctx: SolidityParser.TypeNameContext): Type {
        if(ctx.elementaryTypeName() != null) {
            return TypeParser.createFrom(ctx.elementaryTypeName().text, false)
        }

        logger.warn("Empty type name could not be translated properly")

        return UnknownType.getUnknownType()
    }
}