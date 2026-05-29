import 'package:flutter/material.dart';
import 'theme_extensions.dart';

/// Extensions for accessing text styles from BuildContext.
///
/// Example:
/// ```dart
/// TextStyle style = context.titleLarge;
/// ```
extension ContextTypographyExtensions on BuildContext {
  /// Display large text style. Returns a default [TextStyle] if null.
  ///
  /// Example:
  /// ```dart
  /// TextStyle style = context.displayLarge;
  /// ```
  TextStyle get displayLarge => textTheme.displayLarge ?? const TextStyle();

  /// Display medium text style. Returns a default [TextStyle] if null.
  TextStyle get displayMedium => textTheme.displayMedium ?? const TextStyle();

  /// Display small text style. Returns a default [TextStyle] if null.
  TextStyle get displaySmall => textTheme.displaySmall ?? const TextStyle();

  /// Headline large text style. Returns a default [TextStyle] if null.
  TextStyle get headlineLarge => textTheme.headlineLarge ?? const TextStyle();

  /// Headline medium text style. Returns a default [TextStyle] if null.
  TextStyle get headlineMedium => textTheme.headlineMedium ?? const TextStyle();

  /// Headline small text style. Returns a default [TextStyle] if null.
  TextStyle get headlineSmall => textTheme.headlineSmall ?? const TextStyle();

  /// Title large text style. Returns a default [TextStyle] if null.
  TextStyle get titleLarge => textTheme.titleLarge ?? const TextStyle();

  /// Title medium text style. Returns a default [TextStyle] if null.
  TextStyle get titleMedium => textTheme.titleMedium ?? const TextStyle();

  /// Title small text style. Returns a default [TextStyle] if null.
  TextStyle get titleSmall => textTheme.titleSmall ?? const TextStyle();

  /// Body large text style. Returns a default [TextStyle] if null.
  TextStyle get bodyLarge => textTheme.bodyLarge ?? const TextStyle();

  /// Body medium text style. Returns a default [TextStyle] if null.
  TextStyle get bodyMedium => textTheme.bodyMedium ?? const TextStyle();

  /// Body small text style. Returns a default [TextStyle] if null.
  TextStyle get bodySmall => textTheme.bodySmall ?? const TextStyle();

  /// Label large text style. Returns a default [TextStyle] if null.
  TextStyle get labelLarge => textTheme.labelLarge ?? const TextStyle();

  /// Label medium text style. Returns a default [TextStyle] if null.
  TextStyle get labelMedium => textTheme.labelMedium ?? const TextStyle();

  /// Label small text style. Returns a default [TextStyle] if null.
  TextStyle get labelSmall => textTheme.labelSmall ?? const TextStyle();
}
