package de.fraunhofer.aisec.cpg.frontends.solidity;

import SolidityLexer
import SolidityParser
import de.fraunhofer.aisec.cpg.TranslationConfiguration
import de.fraunhofer.aisec.cpg.frontends.LanguageFrontend
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.ModifierDefinition
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Pragma
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Rollback
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Version
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.TypeManager
import de.fraunhofer.aisec.cpg.graph.declarations.FunctionDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.MethodDeclaration
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
import java.util.*
import kotlin.collections.ArrayList


class SolidityLanguageFrontend(
    config: @NonNull TranslationConfiguration,
    scopeManager: ScopeManager?,
) : LanguageFrontend(config, scopeManager, ".") {

    private val logger = LoggerFactory.getLogger(SolidityLanguageFrontend.javaClass)

    public val additionalNodes = mutableListOf<Node>()

    val statementHandler = StatementHandler(this)
    val expressionHandler = ExpressionHandler(this)
    val typeHandler = TypeHandler(this)
    val declarationHandler = DeclarationHandler(this)
    var currentFile: File? = null;

    var modifierStack: Stack<ParserRuleContext> = Stack<ParserRuleContext>()

    val functionsWithModifiers: MutableMap<SolidityParser.FunctionDefinitionContext, MethodDeclaration> = mutableMapOf()
    val modifierMap: MutableMap<ModifierDefinition, SolidityParser.ModifierDefinitionContext> = mutableMapOf()
    val modifierIdentifierMap: MutableMap<SolidityParser.ModifierDefinitionContext, MutableMap<String, SolidityParser.ExpressionContext>> = mutableMapOf()
    var currentIdentifierMapStack: Stack<MutableMap<String, SolidityParser.ExpressionContext>> = Stack<MutableMap<String, SolidityParser.ExpressionContext>>()

    val rollbackNodes: MutableMap<FunctionDeclaration, Rollback> = mutableMapOf()

    override fun parse(file: File): TranslationUnitDeclaration {
        TypeManager.getInstance().setLanguageFrontend(this)

        val lexer = SolidityLexer(ANTLRInputStream(FileInputStream(file)))
        val stream = CommonTokenStream(lexer)
        val parser = SolidityParser(stream)
        currentFile = file

        val tu  = handleSourceUnit(file.name, parser.sourceUnit())
        tu.name = file.name
        return tu
    }

    companion object {
        @kotlin.jvm.JvmField var SOLIDITY_EXTENSIONS: List<String> = listOf(".sol")
    }

    private fun handleSourceUnit(filename: String, unit: SolidityParser.SourceUnitContext): TranslationUnitDeclaration {
        var tu = TranslationUnitDeclaration()


        // reset global scope to this translation unit
        this.scopeManager.resetToGlobal(tu)

        this.scopeManager.lang = this

        unit.pragmaDirective()?.let {
            val pragma = handlePragmas(it)
            additionalNodes.add(pragma)
        }

        for(contract in unit.contractDefinition()) {
            var decl = this.declarationHandler.handle(contract)

            // add contract declaration to TU
            this.scopeManager.addDeclaration(decl)
        }

        if(unit.contractPart() != null || unit.block() != null || unit.statement() != null){

            var decl = this.declarationHandler.handleMissingContractDefinition(filename,unit)

            // add contract declaration to TU
            this.scopeManager.addDeclaration(decl)
        }



        functionsWithModifiers.forEach { k, v ->
            if(k.block() != null) {
                declarationHandler.handleModifierExpansion(k, v)
            }
        }

        return tu
    }

    fun handlePragmas(pragmas: List<SolidityParser.PragmaDirectiveContext>): Pragma{
        var solPragmas = pragmas.filter { it.pragmaName().text.lowercase().equals("solidity") }
        var versionConstraints: List<SolidityParser.VersionConstraintContext> =
            solPragmas.flatMap  { it.pragmaValue().version().versionConstraint() }
        var reducedConstraints: MutableList<Version> = versionConstraints.flatMap {
            // Todo replace constraints with ^ and ~ with the respective lower and upper bounds
            val versionConCPG: MutableList<Version> = mutableListOf()
            val versionLiteral = (it.VersionLiteral()?.text?: it.DecimalNumber()?.text)!!.split(".")
            val operator = it.versionOperator()?.text?: "="
            operator.let {
                if(it.equals("^")){
                    val upperVersion = ArrayList(versionLiteral)
                    val converted: MutableList<Int> = upperVersion.map { toVersionNumber(it) }.toMutableList() // Convert to numbers
                    converted.addAll(MutableList(3 - versionLiteral.size) { 0 }) // Padding to have exactly 3 version entries
                    var incremented= false
                    for(i in 0..2){
                        if(!incremented && converted[i] != 0){
                            converted[i] = converted[i]+1
                            incremented = true
                        }else if(incremented){
                            converted[i] = 0
                        }

                    }
                    versionConCPG.add(Version("<", converted[0], converted[1], converted[2]))
                    versionConCPG.add(toLowerBoundVersion(versionLiteral))
                }else if(it.equals("~")){
                    val upperVersion = ArrayList(versionLiteral)
                    val converted: MutableList<Int> = upperVersion.map { toVersionNumber(it) }.toMutableList() // Convert to numbers

                    val upperV = if(converted.size == 1)
                        Version("<", converted[0]+1, 0, 0)
                    else if(converted.size > 1)
                        Version("<", converted[0], converted[1] + 1,0)
                    else
                        Version("<=",0,0,0)

                    versionConCPG.add(upperV)
                    versionConCPG.add(toLowerBoundVersion(versionLiteral))
                }else if(it.equals("=")){
                    val upperVersion = ArrayList(versionLiteral)
                    val converted: MutableList<Int> = upperVersion.map { toVersionNumber(it) }.toMutableList()
                    converted.addAll(MutableList(3 - versionLiteral.size) { 0 })
                    versionConCPG.add(Version("<=", converted[0], converted[1], converted[2]))
                    versionConCPG.add(Version(">=", converted[0], converted[1], converted[2]))
                }else{
                    val upperVersion = ArrayList(versionLiteral)
                    val converted: MutableList<Int> = upperVersion.map { toVersionNumber(it) }.toMutableList()
                    converted.addAll(MutableList(3 - versionLiteral.size) { 0 })
                    versionConCPG.add(Version(it, converted[0], converted[1], converted[2]))
                }
            }
            versionConCPG
        }.toMutableList()
        val upperBounds = reducedConstraints.filter { it.operator.equals("<=") || it.operator.equals("<") }.sorted()
        val lowerBounds = reducedConstraints.filter { it.operator.equals(">=") || it.operator.equals(">") }.sorted()
        val pragma = Pragma()
        if(upperBounds.isNotEmpty()){
            pragma.maximal = upperBounds.first()
        }

        if(lowerBounds.isNotEmpty()){
            pragma.minimal = upperBounds.last()
        }
        return pragma
    }


    fun toLowerBoundVersion(literal: List<String>): Version{
        val major = if(literal.size > 0) toVersionNumber(literal[0]) else 0
        val minor = if(literal.size > 1) toVersionNumber(literal[1]) else 0
        val patch = if(literal.size > 2) toVersionNumber(literal[2]) else 0
        return Version(">=",major, minor, patch)
    }

    fun toVersionNumber(versionString: String): Int {
        try {
            return versionString.toInt()
        } catch (e: NumberFormatException) {
            return 0
        }
    }

    fun toCPGSolidityVersion(versionConstraint: SolidityParser.VersionConstraintContext): Version{
        return Version("=", 0, 0, 0)
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