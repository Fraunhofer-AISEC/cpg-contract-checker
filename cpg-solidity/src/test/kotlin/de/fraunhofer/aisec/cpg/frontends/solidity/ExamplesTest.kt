package de.fraunhofer.aisec.cpg.frontends.solidity

import org.junit.jupiter.api.Test
import java.nio.file.Path
import kotlin.test.assertNotNull

class ExamplesTest {
    @Test
    fun testExample3() {
        val topLevel = Path.of("src", "test", "resources", "examples")
        val tu =
            TestUtils.analyzeAndGetFirstTU(
                listOf(topLevel.resolve("example3.sol").toFile()),
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