import 'package:flutter/material.dart';

/// Extensions for focus management from BuildContext.
///
/// Example:
/// ```dart
/// context.unfocus();
/// ```
extension ContextFocusExtensions on BuildContext {
  /// Unfocuses the current focus node, hiding the keyboard if open.
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
