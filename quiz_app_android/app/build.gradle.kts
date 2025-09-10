import org.gradle.testing.jacoco.tasks.JacocoReport // Explicit import for JacocoReport
import org.gradle.api.tasks.testing.Test // Explicit import for Test

plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.kotlin.compose)
    alias(libs.plugins.kotlin.parcelize)
    // Hilt Plugin
    alias(libs.plugins.hilt.android)

    alias(libs.plugins.ksp)
    id("jacoco")
    id("org.sonarqube")
}

android {
    namespace = "com.tnm.quizmaster"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.tnm.quizmaster"
        minSdk = 24
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        debug {
            enableUnitTestCoverage = true
            enableAndroidTestCoverage = false
            buildConfigField("String", "BASE_URL", "\"https://mrkivan.github.io/quiz_app_data/\"")
        }
        release {
            buildConfigField("String", "BASE_URL", "\"https://production.yourdomain.com/api/\"")
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    buildFeatures {
        compose = true
        buildConfig = true
    }

    hilt {
        enableAggregatingTask = false
    }
}
kotlin {
    jvmToolchain(11) // instead of jvmTarget = "11"

    compilerOptions {
        // Add any free compiler args here
        freeCompilerArgs.add("-XXLanguage:+PropertyParamAnnotationDefaultTargetMode")
    }
}
/// Configure JaCoCo for unit tests
jacoco {
    toolVersion = "0.8.13" // Use a recent version
}


tasks.withType<Test> {
    finalizedBy(tasks.named("jacocoTestReport"))
}


tasks.register<JacocoReport>("jacocoTestReport") {
    dependsOn(tasks.named("testReleaseUnitTest")) // Depend on release unit tests
    group = "verification"
    description = "Generates JaCoCo code coverage report for unit tests"


    // Specify source and class directories
    sourceDirectories.setFrom(files("src/main/java", "src/main/kotlin"))
    classDirectories.setFrom(
        files(
            "${layout.buildDirectory.get().asFile}/intermediates/javac/release/classes",
            "${layout.buildDirectory.get().asFile}/tmp/kotlin-classes/release"
        ).map {
            fileTree(it) {
                include("**/*ViewModel.class") // Include only ViewModel classes
                exclude(
                    "**/R.class",
                    "**/R$*.class",
                    "**/BuildConfig.*",
                    "**/Manifest*.*",
                    "**/*Activity*.*",
                    "**/*Fragment*.*",
                    "**/databinding/**/*.*",
                    "**/generated/**/*.*",
                    "**/*ComposablesKt*.*", // Exclude Compose-generated classes
                    "**/*_HiltModules*.*" // Exclude Hilt-generated classes
                )
            }
        })
    executionData.setFrom(files("${layout.buildDirectory.get().asFile}/jacoco/testReleaseUnitTest.exec"))


    // Configure reports
    reports {
        xml.required.set(true)
        html.required.set(true) // Use 'required' instead of 'enabled'
        html.outputLocation.set(layout.buildDirectory.dir("reports/jacoco/test/html"))
    }


    // Debug and print coverage percentage to console
    doLast {
        val execFile = file("${layout.buildDirectory.get().asFile}/jacoco/testReleaseUnitTest.exec")
        println("Execution Data File: $execFile")
        println("Execution Data Exists: ${execFile.exists()}")
        val classDirs = files(
            "${layout.buildDirectory.get().asFile}/intermediates/javac/release/classes",
            "${layout.buildDirectory.get().asFile}/tmp/kotlin-classes/release"
        )
        println("Class Directories: $classDirs")
        println("Class Directories Exist: ${classDirs.all { it.exists() }}")
        val report =
            file("${layout.buildDirectory.get().asFile}/reports/jacoco/test/html/index.html")
        println("Test Coverage Report: $report")
        if (report.exists()) {
            val content = report.readText()
            println("HTML Report Content (first 1000 chars): ${content.take(1000)}")
            // Try multiple regex patterns to parse coverage
            val patterns = listOf(
                Regex("<td>Total.*?(\\d+%)</td>"),
                Regex("Total</span>.*?(\\d+\\.\\d+%)</td>"),
                Regex("(\\d+\\.\\d+)%")
            )
            var coverageFound = false
            for (pattern in patterns) {
                val matcher = pattern.find(content)
                if (matcher != null) {
                    println("Total Test Coverage: ${matcher.groupValues[1]}")
                    coverageFound = true
                    break
                }
            }
            if (!coverageFound) {
                println("Could not parse coverage percentage from report")
            }
        } else {
            println("Coverage report not found at $report")
        }
    }
}

sonarqube {
    properties {
        property("sonar.projectKey", "quiz_app_android")
        property("sonar.projectName", "Quiz App Android")
        property("sonar.host.url", "http://localhost:9000")
        property("sonar.login", "PASTE_YOUR_TOKEN_HERE")
        property("sonar.language", "kotlin")
        property("sonar.sourceEncoding", "UTF-8")
        property("sonar.sources", "src/main/java")
        property("sonar.tests", "src/test/java,src/androidTest/java")
    }
}

dependencies {
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.ui)
    implementation(libs.androidx.ui.graphics)
    implementation(libs.androidx.ui.tooling.preview)
    implementation(libs.androidx.material3)
    implementation(libs.androidx.navigationevent)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(platform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.ui.test.junit4)
    debugImplementation(libs.androidx.ui.tooling)
    debugImplementation(libs.androidx.ui.test.manifest)

    implementation(libs.hilt.android)
    // Hilt for AndroidX (e.g., Jetpack Compose ViewModels)
    implementation(libs.androidx.hilt.navigation.compose)

    ksp(libs.hilt.compiler)
    ksp(libs.androidx.hilt.compiler)

    implementation(libs.retrofit)
    implementation(libs.converter.gson)
    implementation(libs.logging.interceptor)

    implementation(libs.lottie.compose)
    // Core testing
    testImplementation(libs.junit)
    testImplementation(libs.androidx.core.testing) // For InstantTaskExecutorRule
    // Coroutines testing
    testImplementation(libs.kotlinx.coroutines.test) // Use the latest version
    testImplementation(libs.kotlin.test) // for kotlin.test.assertEquals
    // --- MockK (for mocking coroutines, suspend functions, etc.) ---
    testImplementation(libs.mockk)
    // --- Turbine (Flow testing) ---
    testImplementation(libs.turbine)
}