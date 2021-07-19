package de.fraunhofer.aisec.cpg.frontends.solidity;

import SolidityLexer
import SolidityParser
import de.fraunhofer.aisec.cpg.TranslationConfiguration
import de.fraunhofer.aisec.cpg.frontends.LanguageFrontend
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.passes.scopes.ScopeManager
import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CharStream
import org.antlr.v4.runtime.CommonTokenStream
import org.checkerframework.checker.nullness.qual.NonNull
import java.io.File
import java.io.FileInputStream

class SolidityLanguageFrontend(
    config: @NonNull TranslationConfiguration,
    scopeManager: ScopeManager?,
) : LanguageFrontend(config, scopeManager, ".") {
    val statementHandler = StatementHandler(this)
    val expressionHandler = ExpressionHandler(this)
    val typeHandler = TypeHandler(this)
    val declarationHandler = DeclarationHandler(this)

    override fun parse(file: File): TranslationUnitDeclaration {
        val lexer = SolidityLexer(ANTLRInputStream(FileInputStream(file)))
        val stream = CommonTokenStream(lexer)
        val parser = SolidityParser(stream)

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
        return null
    }

    override fun <T : Any?> getLocationFromRawNode(astNode: T): PhysicalLocation? {
        return null
    }

    override fun <S : Any?, T : Any?> setComment(s: S, ctx: T) {

    }

}