/*
 * Copyright (c) 2019, Fraunhofer AISEC. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *                    $$$$$$\  $$$$$$$\   $$$$$$\
 *                   $$  __$$\ $$  __$$\ $$  __$$\
 *                   $$ /  \__|$$ |  $$ |$$ /  \__|
 *                   $$ |      $$$$$$$  |$$ |$$$$\
 *                   $$ |      $$  ____/ $$ |\_$$ |
 *                   $$ |  $$\ $$ |      $$ |  $$ |
 *                   \$$$$$   |$$ |      \$$$$$   |
 *                    \______/ \__|       \______/
 *
 */
package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.TranslationConfiguration
import de.fraunhofer.aisec.cpg.TranslationManager
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.TypeManager
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.helpers.Util
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.util.function.Consumer
import java.util.function.Predicate
import java.util.stream.Collectors
import org.apache.commons.lang3.reflect.FieldUtils
import org.junit.jupiter.api.Assertions

object TestUtils {

    @JvmStatic
    fun <S : Node?> findByPredicate(nodes: Collection<S>, predicate: Predicate<S>?): List<S> {
        return nodes.stream().filter(predicate).collect(Collectors.toList())
    }




    /**
     * Default way of parsing a list of files into a full CPG. All default passes are applied
     *
     * @param topLevel The directory to traverse while looking for files to parse
     * @param usePasses Whether the analysis should run passes after the initial phase
     * @param configModifier An optional modifier for the config
     *
     * @return A list of [TranslationUnitDeclaration] nodes, representing the CPG roots
     * @throws Exception Any exception thrown during the parsing process
     */
    @JvmOverloads
    @JvmStatic
    @Throws(Exception::class)
    fun analyze(
        files: List<File>?,
        topLevel: Path,
        usePasses: Boolean,
        configModifier: Consumer<TranslationConfiguration.Builder>? = null
    ): List<TranslationUnitDeclaration> {
        val builder =
            TranslationConfiguration.builder()
                .sourceLocations(files!!)
                .topLevel(topLevel.toFile())
                .loadIncludes(true)
                .disableCleanup()
                .debugParser(true)
                .failOnError(true)
                .defaultLanguages()
        if (usePasses) {
            builder.defaultPasses()
        }
        configModifier?.accept(builder)
        val config = builder.build()
        val analyzer = TranslationManager.builder().config(config).build()
        return analyzer.analyze().get().translationUnits
    }

    @JvmOverloads
    @JvmStatic
    @Throws(Exception::class)
    fun analyzeAndGetFirstTU(
        files: List<File>?,
        topLevel: Path,
        usePasses: Boolean,
        configModifier: Consumer<TranslationConfiguration.Builder>? = null
    ): TranslationUnitDeclaration {
        val translationUnits = analyze(files, topLevel, usePasses, configModifier)
        return translationUnits.stream().findFirst().orElseThrow()
    }
}