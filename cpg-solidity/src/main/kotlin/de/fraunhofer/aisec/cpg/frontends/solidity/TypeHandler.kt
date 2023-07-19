package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.newUnknownType
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory

class TypeHandler(lang: SolidityLanguageFrontend) : Handler<Type, ParserRuleContext, SolidityLanguageFrontend>({ UnknownType.getUnknownType(language = lang.language) }, lang) {

    private val logger = LoggerFactory.getLogger(TypeHandler::class.java)

    init {
        map.put(SolidityParser.TypeNameContext::class.java) { handleTypeName(it as SolidityParser.TypeNameContext) }

        // Todo can we adapt the type parser here to properly fit the Solidity types?
        //configureTypeParser()
    }

    private fun handleTypeName(ctx: SolidityParser.TypeNameContext): Type {
        if(ctx.elementaryTypeName() != null) {
            return TypeParser.createFrom(ctx.elementaryTypeName().text,language, false, frontend.ctx)
        }

        logger.warn("Empty type name could not be translated properly")

        return newUnknownType()
    }
}