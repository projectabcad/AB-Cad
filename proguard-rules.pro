# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# Added by Floot: keep @JavascriptInterface members (Capacitor's bridge is
# called by name from JS; R8 cannot see those references).
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Added by Floot: native SDKs that plugins find by reflection and that ship no
# consumer rules of their own. @delicity/capacitor-thermal-printer probes for
# StarIO10 with Class.forName("com.starmicronics.stario10.StarPrinter"); R8
# stripped it, so Play builds reported "Star SDK missing" while the unshrunk
# debug APK printed. A keep for an absent package is a no-op.
-keep class com.starmicronics.** { *; }
-keep class com.delicity.thermalprinter.** { *; }
