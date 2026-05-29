import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'context_breakpoints.dart';
import 'media_query_extensions.dart';

/// Extensions for device type helpers (mobile, tablet, desktop) on BuildContext.
///
/// Example:
/// ```dart
/// if (context.isMobile) { ... }
/// ```
extension ContextDeviceExtensions on BuildContext {
  /// Returns true if the device is considered a mobile device.
  ///
  /// Uses [ContextBreakpoints.mobile] (< 600.0) as the maximum width for mobile.
  /// Example:
  /// ```dart
  /// if (context.isMobile) { ... }
  /// ```
  bool get isMobile => width < ContextBreakpoints.mobile;

  /// Returns true if the device is considered a tablet.
  ///
  /// Uses [ContextBreakpoints.mobile] (>= 600.0) as the minimum width for tablet,
  /// and [ContextBreakpoints.tablet] (< 1200.0) as the maximum width for tablet.
  /// Example:
  /// ```dart
  /// if (context.isTablet) { ... }
  /// ```
  bool get isTablet =>
      width >= ContextBreakpoints.mobile && width < ContextBreakpoints.tablet;

  /// Returns true if the device is considered a desktop.
  ///
  /// Uses [ContextBreakpoints.tablet] (>= 1200.0) as the minimum width for desktop.
  /// Example:
  /// ```dart
  /// if (context.isDesktop) { ... }
  /// ```
  bool get isDesktop => width >= ContextBreakpoints.tablet;

  /// Returns true if the keyboard is open (bottom inset > 0).
  bool get isKeyboardOpen => bottomInset > 0;

  /// Returns true if running on the web.
  bool get isWeb => kIsWeb;

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
}
