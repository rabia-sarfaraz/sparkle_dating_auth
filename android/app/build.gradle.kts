// File: android/app/build.gradle

plugins {
    id 'com.android.application'
    id 'kotlin-android'
    id 'dev.flutter.flutter-gradle-plugin'
    id 'com.google.gms.google-services' // ✅ THIS IS RIGHT!
}

android {
    namespace = "auth.project.sparkle_dating" // ✅ EXACT SAME AS IN google-services.json!
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "auth.project.sparkle_dating" // ✅ EXACT MATCH!
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug") // Use your release config later!
        }
    }
}

flutter {
    source = "../.."
}
