package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.graph.declarations.RecordDeclaration
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.nio.file.Path
import kotlin.test.assertNotNull

class SolidityLanguageFrontendTest {
    @Test
    fun testFrontend() {
        val topLevel = Path.of("src", "test", "resources")
        val tu =
            TestUtils.analyzeAndGetFirstTU(
                listOf(topLevel.resolve("storage.sol").toFile()),
                topLevel,
                true
            ) {
                it.registerLanguage(
                    SolidityLanguageFrontend::class.java,
                    SolidityLanguageFrontend.SOLIDITY_EXTENSIONS
                )
            }

        assertNotNull(tu)

        val record = tu.getDeclarationAs(0, RecordDeclaration::class.java)

        assertNotNull(record)

        val fields = record.fields

        assertNotNull(fields)

        assertEquals(1, fields.size)

        val field = fields.first()

        assertNotNull(field)

        assertEquals(TypeParser.createFrom("uint", false), field.type)
        assertEquals("data", field.name)

        val methods = record.methods

        assertNotNull(methods)

        assertEquals(2, methods.size)
    }
}