import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'media_query_extensions.dart';

/// Extensions for device, platform, display, and input helpers on BuildContext.
///
/// Breakpoint/window-size-class getters (isMobile, isTablet, isExpanded,
/// isDesktop, isExtraLarge) live in [ContextBreakpointExtensions] inside
/// `context_breakpoints.dart`, co-located with the [ContextBreakpoints] constants.
///
/// All platform-specific getters here are web-safe (guarded with [kIsWeb]).
///
/// Example:
/// ```dart
/// if (context.isKeyboardOpen) { ... }
/// if (context.isAndroid) { ... }
/// if (context.isTouchDevice) { ... }
/// ```
extension ContextDeviceExtensions on BuildContext {
  /// Returns true if the software keyboard is currently visible (bottom inset > 0).
  bool get isKeyboardOpen => bottomInset > 0;

  // ─── Display ─────────────────────────────────────────────────────────────

  /// Returns true if the device has a high-density display (device pixel ratio > 2).
  ///
  /// A pixel ratio of 2.0 is the boundary between mdpi/hdpi and xhdpi displays.
  /// Devices with ratio > 2.0 are considered high-density (e.g. iPhone Retina,
  /// Android xxhdpi and above).
  ///
  /// Useful for conditionally loading high-resolution assets.
  ///
  /// Source: Flutter [MediaQueryData.devicePixelRatio] docs —
  /// https://api.flutter.dev/flutter/widgets/MediaQueryData/devicePixelRatio.html
  ///
  /// Android density reference —
  /// https://developer.android.com/training/multiscreen/screendensities
  bool get isHighDensityDisplay => devicePixelRatio > 2.0;

  /// Returns true if the device likely has a display notch or cutout
  /// (i.e. [MediaQueryData.padding] top > 24 dp).
  ///
  /// The 24 dp threshold is a widely adopted heuristic in the Flutter community:
  /// a standard Android status bar is exactly 24 dp; any value above that
  /// indicates a cutout, notch, or dynamic island pushing content further down.
  ///
  /// On iPhone, Face ID / Dynamic Island models report safeTop of ~44–59 pt.
  /// On notch-less Android phones, safeTop is typically exactly 24 dp.
  ///
  /// Source: Flutter [MediaQueryData.padding] docs —
  /// https://api.flutter.dev/flutter/widgets/MediaQueryData/padding.html
  ///
  /// iOS Human Interface Guidelines (safe areas) —
  /// https://developer.apple.com/design/human-interface-guidelines/layout#Safe-areas
  bool get hasNotch => safeTop > 24.0;

  /// Returns true if the device has a software home indicator bar
  /// (i.e. [MediaQueryData.padding] bottom > 0 dp).
  ///
  /// On iPhones with Face ID (iPhone X and later), the system reserves bottom
  /// space for the home indicator gesture bar (typically 34 pt). On Android
  /// devices using gesture navigation, the bottom safe area is > 0 as well.
  ///
  /// Source: Flutter [MediaQueryData.padding] docs —
  /// https://api.flutter.dev/flutter/widgets/MediaQueryData/padding.html
  ///
  /// iOS Human Interface Guidelines (home indicator) —
  /// https://developer.apple.com/design/human-interface-guidelines/layout#Safe-areas
  bool get hasHomeIndicator => safeBottom > 0.0;

  // ─── Platform (all guarded with kIsWeb) ──────────────────────────────────
  // Source: Flutter [TargetPlatform] enum —
  // https://api.flutter.dev/flutter/foundation/TargetPlatform.html
  //
  // Source: Flutter [kIsWeb] constant —
  // https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html

  /// Returns true if running on the web.
  ///
  /// Uses [kIsWeb] from `package:flutter/foundation.dart`, which is the
  /// officially recommended way to detect web in Flutter.
  bool get isWeb => kIsWeb;

  /// Returns true if running on a native mobile platform (Android or iOS).
  ///
  /// Always false on web.
  bool get isNativeMobile => isAndroid || isIOS;

  /// Returns true if running on a native desktop platform
  /// (macOS, Windows, or Linux).
  ///
  /// Always false on web.
  bool get isNativeDesktop => isMacOS || isWindows || isLinux;

  /// Returns true if running on Android (never true on web).
  bool get isAndroid =>
      !kIsWeb && Theme.of(this).platform == TargetPlatform.android;

  /// Returns true if running on iOS (never true on web).
  bool get isIOS => !kIsWeb && Theme.of(this).platform == TargetPlatform.iOS;

  /// Returns true if running on macOS (never true on web).
  bool get isMacOS =>
      !kIsWeb && Theme.of(this).platform == TargetPlatform.macOS;

  /// Returns true if running on Windows (never true on web).
  bool get isWindows =>
      !kIsWeb && Theme.of(this).platform == TargetPlatform.windows;

  /// Returns true if running on Linux (never true on web).
  bool get isLinux =>
      !kIsWeb && Theme.of(this).platform == TargetPlatform.linux;

  /// Returns true if running on Fuchsia (never true on web).
  bool get isFuchsia =>
      !kIsWeb && Theme.of(this).platform == TargetPlatform.fuchsia;

  // ─── Pointer / Input ─────────────────────────────────────────────────────
  // Heuristic based on Flutter's [TargetPlatform] classification.
  // Flutter itself uses this grouping internally for scroll physics and
  // gesture behavior defaults.
  //
  // Source: Flutter [ScrollBehavior.getPlatform] —
  // https://api.flutter.dev/flutter/widgets/ScrollBehavior/getPlatform.html

  /// Returns true if the primary input is likely touch-based
  /// (Android, iOS, or Fuchsia).
  ///
  /// Flutter uses the same grouping internally to decide scroll physics
  /// and gesture behavior. Useful for adjusting touch target sizes or
  /// disabling hover effects on touch-only devices.
  bool get isTouchDevice => isAndroid || isIOS || isFuchsia;

  /// Returns true if the primary input is likely a pointer/mouse
  /// (macOS, Windows, Linux, or web).
  ///
  /// Useful for enabling hover interactions, tooltips, or right-click menus
  /// that are not appropriate on touch screens.
  bool get isPointerDevice => isMacOS || isWindows || isLinux || isWeb;
}
