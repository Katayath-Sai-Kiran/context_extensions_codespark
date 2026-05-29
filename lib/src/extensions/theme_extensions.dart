import 'package:flutter/material.dart';

/// Extensions for accessing theme properties from BuildContext.
///
/// Example:
/// ```dart
/// ColorScheme scheme = context.colorScheme;
/// ```
extension ContextThemeExtensions on BuildContext {
  /// The color scheme from the current theme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// The text theme from the current theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns true if the current theme is dark mode.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Returns true if the current theme is light mode.
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// The primary color from the color scheme.
  Color get primaryColor => colorScheme.primary;

  /// The surface color from the color scheme.
  Color get surfaceColor => colorScheme.surface;

  /// The background color from the color scheme (deprecated in Flutter 3.18, use [surface] or [surfaceVariant] instead).
  ///
  /// Prefer [surfaceColor] or [surfaceVariantColor] for new code.
  Color get backgroundColor => colorScheme.background;

  /// The surface variant color from the color scheme.
  Color get surfaceVariantColor => colorScheme.surfaceVariant;

  /// The inverse surface color from the color scheme.
  Color get inverseSurfaceColor => colorScheme.inverseSurface;

  /// The error color from the color scheme.
  Color get errorColor => colorScheme.error;

  /// The outline color from the color scheme.
  Color get outlineColor => colorScheme.outline;

  /// The secondary color from the color scheme.
  Color get secondaryColor => colorScheme.secondary;
}
