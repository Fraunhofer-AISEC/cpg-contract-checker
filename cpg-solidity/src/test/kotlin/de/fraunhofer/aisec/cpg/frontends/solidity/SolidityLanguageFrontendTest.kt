package de.fraunhofer.aisec.cpg.frontends.solidity

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test
import java.nio.file.Path

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
    }
}