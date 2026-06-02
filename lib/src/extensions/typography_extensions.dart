import 'package:flutter/material.dart';
import 'theme_extensions.dart';
import 'media_query_extensions.dart';
import 'context_breakpoints.dart';

/// Extensions for accessing and adapting text styles from BuildContext.
///
/// All style getters return a safe `TextStyle()` fallback — never null,
/// never throws.
///
/// Example:
/// ```dart
/// Text('Hello', style: context.titleLarge);
/// Text('Scaled', style: context.scaled(context.bodyMedium));
/// ```
extension ContextTypographyExtensions on BuildContext {
  // ─── Display ─────────────────────────────────────────────────────────────

  /// Display large text style. Returns a default [TextStyle] if null.
  ///
  /// Example:
  /// ```dart
  /// Text('Big heading', style: context.displayLarge);
  /// ```
  TextStyle get displayLarge => textTheme.displayLarge ?? const TextStyle();

  /// Display medium text style. Returns a default [TextStyle] if null.
  TextStyle get displayMedium => textTheme.displayMedium ?? const TextStyle();

  /// Display small text style. Returns a default [TextStyle] if null.
  TextStyle get displaySmall => textTheme.displaySmall ?? const TextStyle();

  // ─── Headline ────────────────────────────────────────────────────────────

  /// Headline large text style. Returns a default [TextStyle] if null.
  TextStyle get headlineLarge => textTheme.headlineLarge ?? const TextStyle();

  /// Headline medium text style. Returns a default [TextStyle] if null.
  TextStyle get headlineMedium => textTheme.headlineMedium ?? const TextStyle();

  /// Headline small text style. Returns a default [TextStyle] if null.
  TextStyle get headlineSmall => textTheme.headlineSmall ?? const TextStyle();

  // ─── Title ───────────────────────────────────────────────────────────────

  /// Title large text style. Returns a default [TextStyle] if null.
  TextStyle get titleLarge => textTheme.titleLarge ?? const TextStyle();

  /// Title medium text style. Returns a default [TextStyle] if null.
  TextStyle get titleMedium => textTheme.titleMedium ?? const TextStyle();

  /// Title small text style. Returns a default [TextStyle] if null.
  TextStyle get titleSmall => textTheme.titleSmall ?? const TextStyle();

  // ─── Body ────────────────────────────────────────────────────────────────

  /// Body large text style. Returns a default [TextStyle] if null.
  TextStyle get bodyLarge => textTheme.bodyLarge ?? const TextStyle();

  /// Body medium text style. Returns a default [TextStyle] if null.
  TextStyle get bodyMedium => textTheme.bodyMedium ?? const TextStyle();

  /// Body small text style. Returns a default [TextStyle] if null.
  TextStyle get bodySmall => textTheme.bodySmall ?? const TextStyle();

  // ─── Label ───────────────────────────────────────────────────────────────

  /// Label large text style. Returns a default [TextStyle] if null.
  TextStyle get labelLarge => textTheme.labelLarge ?? const TextStyle();

  /// Label medium text style. Returns a default [TextStyle] if null.
  TextStyle get labelMedium => textTheme.labelMedium ?? const TextStyle();

  /// Label small text style. Returns a default [TextStyle] if null.
  TextStyle get labelSmall => textTheme.labelSmall ?? const TextStyle();

  // ─── Utilities ───────────────────────────────────────────────────────────

  /// The current text scale factor from [MediaQueryData].
  ///
  /// This reflects the user's system font size preference.
  /// A value of 1.0 means no scaling; 1.5 means 50% larger than normal.
  ///
  /// Example:
  /// ```dart
  /// if (context.fontScale > 1.3) { /* use compact layout */ }
  /// ```
  double get fontScale => textScaler.scale(1.0);

  /// Returns [style] with the current [TextScaler] applied to its font size.
  ///
  /// Useful when you need to manually account for the system font scale
  /// in custom paint or sized containers.
  ///
  /// Example:
  /// ```dart
  /// final scaled = context.scaled(context.bodyMedium);
  /// ```
  TextStyle scaled(TextStyle style) {
    final size = style.fontSize;
    if (size == null) return style;
    return style.copyWith(fontSize: textScaler.scale(size));
  }

  /// Returns one of two text styles depending on the current screen width.
  ///
  /// Uses [ContextBreakpoints.compact] (600 dp) as the threshold.
  /// Returns [mobile] for compact screens, [desktop] for wider screens.
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Hello',
  ///   style: context.adaptiveStyle(
  ///     mobile: context.bodyMedium,
  ///     desktop: context.titleLarge,
  ///   ),
  /// );
  /// ```
  TextStyle adaptiveStyle({
    required TextStyle mobile,
    required TextStyle desktop,
  }) {
    return width < ContextBreakpoints.compact ? mobile : desktop;
  }
}
