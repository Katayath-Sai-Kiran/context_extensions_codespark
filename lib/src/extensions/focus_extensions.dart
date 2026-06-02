import 'package:flutter/material.dart';

/// Extensions for focus and keyboard management from BuildContext.
///
/// Example:
/// ```dart
/// context.unfocus();
/// context.nextFocus();
/// if (context.hasPrimaryFocus) { ... }
/// ```
extension ContextFocusExtensions on BuildContext {
  /// Unfocuses the current focus node, hiding the keyboard if open.
  ///
  /// Example:
  /// ```dart
  /// GestureDetector(
  ///   onTap: () => context.unfocus(),
  ///   child: Scaffold(body: TextField()),
  /// );
  /// ```
  void unfocus() {
    FocusScope.of(this).unfocus();
  }

  /// Moves focus to the next focusable widget in the focus traversal order.
  ///
  /// Equivalent to pressing the Tab key. Useful for custom form navigation.
  ///
  /// Example:
  /// ```dart
  /// TextField(
  ///   onSubmitted: (_) => context.nextFocus(),
  /// );
  /// ```
  void nextFocus() {
    FocusScope.of(this).nextFocus();
  }

  /// Moves focus to the previous focusable widget in the focus traversal order.
  ///
  /// Equivalent to pressing Shift+Tab.
  ///
  /// Example:
  /// ```dart
  /// context.previousFocus();
  /// ```
  void previousFocus() {
    FocusScope.of(this).previousFocus();
  }

  /// Requests focus on the given [node].
  ///
  /// Use this to programmatically focus a specific [FocusNode], for example
  /// to focus a text field after a dialog closes.
  ///
  /// Example:
  /// ```dart
  /// final _emailFocus = FocusNode();
  ///
  /// context.requestFocus(_emailFocus);
  /// ```
  void requestFocus(FocusNode node) {
    FocusScope.of(this).requestFocus(node);
  }

  /// Returns the [FocusScopeNode] for the nearest enclosing [FocusScope].
  ///
  /// Example:
  /// ```dart
  /// final scopeNode = context.focusScopeNode;
  /// ```
  FocusScopeNode get focusScopeNode => FocusScope.of(this);

  /// Returns true if the nearest [FocusScope] currently has focus
  /// (i.e. at least one of its children is focused).
  ///
  /// Example:
  /// ```dart
  /// if (context.isScopeFocused) { /* show active state */ }
  /// ```
  bool get isScopeFocused => FocusScope.of(this).hasFocus;

  /// Returns true if there is currently a primary focus anywhere in the app.
  ///
  /// If false, no widget is focused and the keyboard should be hidden.
  ///
  /// Example:
  /// ```dart
  /// if (context.hasAnyFocus) { context.unfocus(); }
  /// ```
  bool get hasAnyFocus => FocusManager.instance.primaryFocus != null;

  /// Returns the currently focused [FocusNode] in the app, or null if none.
  ///
  /// Example:
  /// ```dart
  /// final node = context.primaryFocusNode;
  /// ```
  FocusNode? get primaryFocusNode => FocusManager.instance.primaryFocus;
}
