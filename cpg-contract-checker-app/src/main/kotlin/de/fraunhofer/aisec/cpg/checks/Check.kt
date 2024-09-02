/*
 * Copyright (c) 2024, Fraunhofer AISEC. All rights reserved.
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
 * ╔═╗╔═╗╔═╗   ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┌─┐┌┬┐  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐
 * ║  ╠═╝║ ╦───║  │ ││││ │ ├┬┘├─┤│   │───║  ├─┤├┤ │  ├┴┐├┤ ├┬┘
 * ╚═╝╩  ╚═╝   ╚═╝└─┘┘└┘ ┴ ┴└─┴ ┴└─┘ ┴   ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─
 *
 */
package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import de.fraunhofer.aisec.cpg.sarif.Region
import java.net.URI
import org.neo4j.driver.Transaction

abstract class Check {
    abstract fun check(transaction: Transaction): List<PhysicalLocation>

    abstract fun getVulnerabilityName(): String

    fun getPhysicalLocationFromResult(row: Map<String, Any>): PhysicalLocation {
        return PhysicalLocation(
            getUriFromAny(row.get("file")),
            Region(
                anyToNumber(row.get("sline")),
                anyToNumber(row.get("scol")),
                anyToNumber(row.get("eline")),
                anyToNumber(row.get("ecol"))
            )
        )
    }

    fun getUriFromAny(value: Any?): URI {
        value?.let {
            return URI.create(it.toString())
        }
        return URI.create("")
    }

    fun anyToNumber(value: Any?): Int {
        value?.let {
            return Integer.parseInt(it.toString())
        }
        return -1
    }

    fun configurePaths(query: String?): String? {
        query?.let {
            return query.replace("*#", "*")
        }
        return null
    }
}
