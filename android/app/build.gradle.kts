plugins {
    id 'com.android.application'
    id 'kotlin-android'
    id 'dev.flutter.flutter-gradle-plugin'
    id 'com.google.gms.google-services' // ✅ Firebase services
}

android {
    namespace 'auth.project.sparkle_dating' // ✅ SAME as in google-services.json

    compileSdkVersion 34 // ✅ Use latest stable compileSdkVersion
    ndkVersion flutter.ndkVersion

    defaultConfig {
        applicationId "auth.project.sparkle_dating" // ✅ MUST MATCH Firebase project
        minSdkVersion 21 // ✅ Firebase Auth needs min 21+
        targetSdkVersion 34
        versionCode flutter.versionCode
        versionName flutter.versionName
        multiDexEnabled true // ✅ Good practice for large apps
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17 // ✅ Use Java 17 if possible
        targetCompatibility JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = '17'
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug // ✅ Use your proper release keystore later!
            shrinkResources false
            minifyEnabled false
            // ✅ Enable ProGuard when needed
            // proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7"
    implementation platform('com.google.firebase:firebase-bom:32.7.2') // ✅ Latest Firebase BoM (check latest)
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.firebase:firebase-auth'
    implementation 'androidx.multidex:multidex:2.0.1' // ✅ For MultiDex if needed
}
