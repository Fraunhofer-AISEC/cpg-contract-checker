package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.graph.declarations.RecordDeclaration
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import java.nio.file.Path
import org.junit.jupiter.api.Test
import kotlin.test.assertEquals
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

        val storage = tu.getDeclarationsByName("Storage", RecordDeclaration::class.java).iterator().next()
        assertNotNull(storage)

        val fields = storage.fields
        assertNotNull(fields)

        assertEquals(1, fields.size)

        val data = fields.first()
        assertNotNull(data)
        assertEquals(TypeParser.createFrom("uint", false), data.type)
        assertEquals("data", data.name)

        val methods = storage.methods
        assertNotNull(methods)

        assertEquals(2, methods.size)
    }
}