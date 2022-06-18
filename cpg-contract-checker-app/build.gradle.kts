import org.gradle.api.file.DuplicatesStrategy
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

/*
 * This file was generated by the Gradle 'init' task.
 */

plugins {
    application
    kotlin("jvm") version "1.6.21"
}

repositories {
    mavenCentral()

    maven { setUrl("https://jitpack.io") }

    ivy {
        setUrl("https://download.eclipse.org/tools/cdt/releases/10.3/cdt-10.3.2/plugins")
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
    api("com.github.Fraunhofer-AISEC", "cpg", "4.2.1")

    // Command line interface support
    api("info.picocli", "picocli", versions["picocli"])
    annotationProcessor("info.picocli", "picocli-codegen", versions["picocli"])

    // logging
    api("org.slf4j:jul-to-slf4j:1.7.32")
    implementation("org.apache.logging.log4j:log4j-slf4j18-impl:2.17.0")
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
        jvmTarget = "11"
    }
}
