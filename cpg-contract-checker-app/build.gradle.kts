import org.gradle.api.file.DuplicatesStrategy
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

/*
 * This file was generated by the Gradle 'init' task.
 */

plugins {
    application
    kotlin("jvm") version "1.9.0"
    id("com.diffplug.spotless") version "6.25.0"

}

repositories {
    mavenCentral()

    maven { setUrl("https://jitpack.io") }

    ivy {
        setUrl("https://download.eclipse.org/tools/cdt/releases/11.0/cdt-11.0.0/plugins")
        metadataSources {
            artifact()
        }
        patternLayout {
            artifact("/[organisation].[module]_[revision].[ext]")
        }
    }
}

val versions = mapOf(
    "picocli" to "4.6.3"
)

dependencies {
    implementation(project(":cpg-solidity"))
    // is needed, but somehow not exported by codyze
    //api("de.fraunhofer.aisec", "cpg", "4.2.1")

    api("org.codehaus.jettison","jettison","1.5.4")

    // Command line interface support
    api("info.picocli", "picocli", versions["picocli"])
    annotationProcessor("info.picocli", "picocli-codegen", versions["picocli"])

    // logging
    api("org.slf4j:jul-to-slf4j:2.0.7")
    implementation("org.apache.logging.log4j:log4j-slf4j2-impl:2.20.0")
}

application {
    // Define the main class for the application.
    mainClass.set("de.fraunhofer.aisec.cpg.AppKt")
}

distributions {
    all {
        contents {
            duplicatesStrategy = DuplicatesStrategy.WARN
        }
    }
}

tasks.withType<KotlinCompile>().configureEach {
    kotlinOptions {
        jvmTarget = "17"
    }
}

// state that JSON schema parser must run before compiling Kotlin
tasks.withType<KotlinCompile> {
    dependsOn("spotlessApply")
}

val headerWithStars = """/*
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
"""

spotless {
    kotlin {
        ktfmt().kotlinlangStyle()
        licenseHeader(headerWithStars).yearSeparator(" - ")
    }

}