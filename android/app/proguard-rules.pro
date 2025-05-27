# Flutter InAppWebView rules
-keep class com.pichillilorenzo.flutter_inappwebview.** { *; }
-keepclassmembers class com.pichillilorenzo.flutter_inappwebview.** { *; }
-keep class androidx.webkit.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class android.webkit.** { *; }
-keepattributes JavascriptInterface
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-dontwarn android.window.BackEvent

# Video player rules
-keep class com.google.android.exoplayer2.** { *; }
-keep class com.google.android.exoplayer2.upstream.** { *; }
-keep class com.google.android.exoplayer2.extractor.** { *; }
-keep class com.google.android.exoplayer2.decoder.** { *; }
-keep class com.google.android.exoplayer2.source.** { *; }
-keep class com.google.android.exoplayer2.trackselection.** { *; }

# Flutter plugins
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.view.** { *; }

# Suppress warnings for Tink annotations
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy