// File: android/build.gradle

buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:8.0.2' // ✅ or your version
        classpath 'com.google.gms:google-services:4.4.0' // ✅ Required for Firebase
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
