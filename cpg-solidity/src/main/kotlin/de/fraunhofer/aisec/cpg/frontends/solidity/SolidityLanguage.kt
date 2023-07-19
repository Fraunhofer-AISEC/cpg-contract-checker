package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.frontends.HasShortCircuitOperators
import de.fraunhofer.aisec.cpg.frontends.HasStructs
import de.fraunhofer.aisec.cpg.frontends.Language
import de.fraunhofer.aisec.cpg.graph.types.*
import org.neo4j.ogm.annotation.Transient
import kotlin.reflect.KClass

class SolidityLanguage : Language<SolidityLanguageFrontend>(), HasShortCircuitOperators, HasStructs {

    @Transient
    override val frontend = SolidityLanguageFrontend::class
    override val conjunctiveOperators = listOf("&&")
    override val disjunctiveOperators = listOf("||")
    override val compoundAssignmentOperators: Set<String> =
        setOf("+=", "-=", "*=", "/=", "%=", "<<=", ">>=",  "&=", "|=", "^=")
    override val fileExtensions: List<String> = listOf("sol")
    override val namespaceDelimiter: String = "."
    override val builtInTypes: Map<String, Type>


    init {
        val types = mutableMapOf(
            "address" to NumericType("address", 20*8, this, NumericType.Modifier.UNSIGNED),
            "bool" to BooleanType("bool", language = this),
            "string" to StringType("string", this),
            "byte" to NumericType("byte", 8, this, NumericType.Modifier.UNSIGNED),

            "int" to IntegerType("int256", 256, this, NumericType.Modifier.SIGNED),
            "uint" to IntegerType("uint256", 256, this, NumericType.Modifier.UNSIGNED),
            "fixed" to NumericType("fixed128x18", 128, this, NumericType.Modifier.SIGNED),
            "ufixed" to NumericType("ufixed128x18", 128, this, NumericType.Modifier.UNSIGNED),
            "bytes" to StringType("bytes", this), // TODO need to see if we can find a better option to represent a dynamical array of bytes
        )
        for (i in 8..256 step 8)
            types.put("int"+i, IntegerType("int"+i, i, this, NumericType.Modifier.SIGNED))

        for (i in 8..256 step 8)
            types.put("uint"+i, IntegerType("uint"+i, i, this, NumericType.Modifier.UNSIGNED))
        for (i in 1..32)
            types.put("bytes"+i, NumericType("bytes"+i, i, this, NumericType.Modifier.UNSIGNED))

        builtInTypes = types
    }
}