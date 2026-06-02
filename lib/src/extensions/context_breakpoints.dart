import 'package:flutter/widgets.dart';
import 'media_query_extensions.dart';

/// Breakpoints for adaptive layouts, based on Google's Material Design 3
/// Window Size Classes specification.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
///
/// Size classes:
/// | Class      | Width range      | Typical devices                     |
/// |------------|------------------|-------------------------------------|
/// | Compact    | 0 – 599 dp       | Phones (portrait)                   |
/// | Medium     | 600 – 839 dp     | Tablets portrait, large phones      |
/// | Expanded   | 840 – 1199 dp    | Tablets landscape, small desktops   |
/// | Large      | 1200 – 1599 dp   | Large desktops, monitors            |
/// | ExtraLarge | 1600 dp+         | Ultra-wide screens                  |
class ContextBreakpoints {
  ContextBreakpoints._();

  // ─── Compact ───────────────────────────────────────────────
  /// Upper bound for compact (phone-sized) windows: < 600 dp.
  ///
  /// A compact window is typically a phone in portrait orientation.
  static const double compact = 600;

  // ─── Medium ────────────────────────────────────────────────
  /// Lower bound for medium windows: >= 600 dp.
  ///
  /// A medium window is typically a large phone in landscape
  /// or a tablet in portrait orientation.
  static const double medium = 600;

  /// Upper bound for medium windows: < 840 dp.
  static const double mediumEnd = 840;

  // ─── Expanded ──────────────────────────────────────────────
  /// Lower bound for expanded windows: >= 840 dp.
  ///
  /// An expanded window is typically a tablet in landscape
  /// or a small desktop/laptop screen.
  static const double expanded = 840;

  /// Upper bound for expanded windows: < 1200 dp.
  static const double expandedEnd = 1200;

  // ─── Large ─────────────────────────────────────────────────
  /// Lower bound for large windows: >= 1200 dp.
  ///
  /// A large window is typically a desktop or laptop monitor.
  static const double large = 1200;

  /// Upper bound for large windows: < 1600 dp.
  static const double largeEnd = 1600;

  // ─── Extra Large ───────────────────────────────────────────
  /// Lower bound for extra-large windows: >= 1600 dp.
  ///
  /// An extra-large window is typically an ultra-wide screen or TV.
  static const double extraLarge = 1600;

  // ─── Convenience aliases (legacy / shorthand) ──────────────
  /// Shorthand alias for [compact] (< 600 dp). Represents the mobile breakpoint.
  static const double mobile = compact;

  /// Shorthand alias for [large] (>= 1200 dp). Represents the desktop breakpoint.
  static const double tablet = large;
}

// ─────────────────────────────────────────────────────────────────────────────
// Breakpoint extensions on BuildContext
// These live alongside [ContextBreakpoints] so the constants and their
// corresponding screen-width checks are always in the same file.
// ─────────────────────────────────────────────────────────────────────────────

/// Extensions that map [ContextBreakpoints] window-size classes onto
/// [BuildContext], based on the Material Design 3 specification.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
///
/// Example:
/// ```dart
/// if (context.isMobile) { /* compact layout */ }
/// if (context.isExpanded) { /* side-by-side layout */ }
/// ```
extension ContextBreakpointExtensions on BuildContext {
  /// Returns true if the window is **compact** (width < 600 dp).
  ///
  /// Typically a phone in portrait orientation.
  /// Threshold: [ContextBreakpoints.compact].
  bool get isMobile => width < ContextBreakpoints.compact;

  /// Returns true if the window is **medium** (600 dp ≤ width < 840 dp).
  ///
  /// Typically a large phone in landscape or a tablet in portrait.
  /// Threshold: [ContextBreakpoints.medium] – [ContextBreakpoints.mediumEnd].
  bool get isTablet =>
      width >= ContextBreakpoints.medium &&
      width < ContextBreakpoints.mediumEnd;

  /// Returns true if the window is **expanded** (840 dp ≤ width < 1200 dp).
  ///
  /// Typically a tablet in landscape or a small desktop.
  /// Threshold: [ContextBreakpoints.expanded] – [ContextBreakpoints.expandedEnd].
  bool get isExpanded =>
      width >= ContextBreakpoints.expanded &&
      width < ContextBreakpoints.expandedEnd;

  /// Returns true if the window is **large** (1200 dp ≤ width < 1600 dp).
  ///
  /// Typically a desktop monitor.
  /// Threshold: [ContextBreakpoints.large] – [ContextBreakpoints.largeEnd].
  bool get isDesktop =>
      width >= ContextBreakpoints.large && width < ContextBreakpoints.largeEnd;

  /// Returns true if the window is **extra-large** (width ≥ 1600 dp).
  ///
  /// Typically an ultra-wide screen or TV.
  /// Threshold: [ContextBreakpoints.extraLarge].
  bool get isExtraLarge => width >= ContextBreakpoints.extraLarge;
}
