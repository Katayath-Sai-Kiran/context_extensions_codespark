import 'package:flutter/material.dart';
import 'media_query_extensions.dart';

/// Extensions for orientation helpers from BuildContext.
///
/// Example:
/// ```dart
/// if (context.isPortrait) { ... }
/// ```
extension ContextOrientationExtensions on BuildContext {
  /// Returns true if the device is in portrait orientation.
  bool get isPortrait => height > width;

  /// Returns true if the device is in landscape orientation.
  bool get isLandscape => width > height;

  /// Returns a value based on orientation.
  ///
  /// Example:
  /// ```dart
  /// double padding = context.valueByOrientation(portrait: 16, landscape: 8);
  /// ```
  T valueByOrientation<T>({required T portrait, required T landscape}) {
    return isPortrait ? portrait : landscape;
  }
}
