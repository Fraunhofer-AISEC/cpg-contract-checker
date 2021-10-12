package de.fraunhofer.aisec.cpg.frontends.solidity;

import SolidityLexer
import SolidityParser
import de.fraunhofer.aisec.cpg.TranslationConfiguration
import de.fraunhofer.aisec.cpg.frontends.LanguageFrontend
import de.fraunhofer.aisec.cpg.graph.TypeManager
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.passes.scopes.ScopeManager
import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import de.fraunhofer.aisec.cpg.sarif.Region
import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.Token
import org.antlr.v4.runtime.misc.Interval
import org.checkerframework.checker.nullness.qual.NonNull
import org.slf4j.LoggerFactory
import java.io.File
import java.io.FileInputStream

class SolidityLanguageFrontend(
    config: @NonNull TranslationConfiguration,
    scopeManager: ScopeManager?,
) : LanguageFrontend(config, scopeManager, ".") {

    private val logger = LoggerFactory.getLogger(SolidityLanguageFrontend.javaClass)

    val statementHandler = StatementHandler(this)
    val expressionHandler = ExpressionHandler(this)
    val typeHandler = TypeHandler(this)
    val declarationHandler = DeclarationHandler(this)
    var currentFile: File? = null;

    override fun parse(file: File): TranslationUnitDeclaration {
        TypeManager.getInstance().setLanguageFrontend(this)

        val lexer = SolidityLexer(ANTLRInputStream(FileInputStream(file)))
        val stream = CommonTokenStream(lexer)
        val parser = SolidityParser(stream)
        currentFile = file

        return handleSourceUnit(parser.sourceUnit())
    }

    companion object {
        @kotlin.jvm.JvmField var SOLIDITY_EXTENSIONS: List<String> = listOf(".sol")
    }

    private fun handleSourceUnit(unit: SolidityParser.SourceUnitContext): TranslationUnitDeclaration {
        var tu = TranslationUnitDeclaration()

        // reset global scope to this translation unit
        this.scopeManager.resetToGlobal(tu)

        this.scopeManager.lang = this

        for(contract in unit.contractDefinition()) {
            var decl = this.declarationHandler.handle(contract)

            // add contract declaration to TU
            this.scopeManager.addDeclaration(decl)
        }

        return tu
    }

    override fun <T : Any?> getCodeFromRawNode(astNode: T): String? {
        if(astNode is ParserRuleContext){
            return astNode.start.inputStream.getText(Interval(astNode.start.startIndex, astNode.stop.stopIndex))
        }else{
            astNode?.let{
                logger.warn("Code was not added as the parsed Object {} is not of type {}", it::class.simpleName, ParserRuleContext::class.simpleName)
            }
        }
        return null
    }

    override fun <T : Any?> getLocationFromRawNode(astNode: T): PhysicalLocation? {
        if(astNode is ParserRuleContext){
            val startToken: Token = astNode.start
            val stopToken: Token = astNode.stop
            val region = Region(startToken.line,
                startToken.charPositionInLine + 1,
                stopToken.line,
                stopToken.charPositionInLine + stopToken.text.length + 1) // + 1 for sarif format
            return PhysicalLocation(currentFile!!.toURI(), region)
        }else{
            astNode?.let{
                logger.warn("PhysicalLocation was not added as the parsed Object {} is not of type {}", it::class.simpleName, ParserRuleContext::class.simpleName)
            }
        }
        return null
    }

    override fun <S : Any?, T : Any?> setComment(s: S, ctx: T) {

    }

}