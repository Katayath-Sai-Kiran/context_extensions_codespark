import 'package:flutter/material.dart';

/// Extensions for showing snackbars from BuildContext.
///
/// Example:
/// ```dart
/// context.showSnackBar('Hello!', duration: Duration(seconds: 2));
/// context.showSuccess('Saved!', action: SnackBarAction(label: 'Undo', onPressed: () {}));
/// ```
extension ContextSnackbarExtensions on BuildContext {
  /// Shows a snackbar with the given message and options.
  ///
  /// [message]: The text to display.
  /// [duration]: How long to display the snackbar (default: 4 seconds).
  /// [action]: Optional action button.
  /// [backgroundColor]: Background color (default: theme surface color).
  /// [textColor]: Text color (default: theme color).
  /// [behavior]: SnackBarBehavior (default: fixed).
  ///
  /// Example:
  /// ```dart
  /// context.showSnackBar('Hello!', duration: Duration(seconds: 2));
  /// ```
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    final theme = Theme.of(this);
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor ?? theme.colorScheme.onSurface),
        ),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor ?? theme.colorScheme.surface,
        behavior: behavior,
      ),
    );
  }

  /// Shows a success snackbar with a green background.
  ///
  /// [message]: The text to display.
  /// [duration]: How long to display the snackbar (default: 4 seconds).
  /// [action]: Optional action button.
  /// [backgroundColor]: Background color (default: Colors.green).
  /// [textColor]: Text color (default: white).
  /// [behavior]: SnackBarBehavior (default: fixed).
  ///
  /// Example:
  /// ```dart
  /// context.showSuccess('Saved!');
  /// ```
  void showSuccess(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
        behavior: behavior,
      ),
    );
  }

  /// Shows an error snackbar with a red background.
  ///
  /// [message]: The text to display.
  /// [duration]: How long to display the snackbar (default: 4 seconds).
  /// [action]: Optional action button.
  /// [backgroundColor]: Background color (default: Colors.red).
  /// [textColor]: Text color (default: white).
  /// [behavior]: SnackBarBehavior (default: fixed).
  ///
  /// Example:
  /// ```dart
  /// context.showError('Something went wrong!');
  /// ```
  void showError(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
        behavior: behavior,
      ),
    );
  }

  /// Shows an info snackbar with a blue background.
  ///
  /// [message]: The text to display.
  /// [duration]: How long to display the snackbar (default: 4 seconds).
  /// [action]: Optional action button.
  /// [backgroundColor]: Background color (default: Colors.blue).
  /// [textColor]: Text color (default: white).
  /// [behavior]: SnackBarBehavior (default: fixed).
  ///
  /// Example:
  /// ```dart
  /// context.showInfo('FYI!');
  /// ```
  void showInfo(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
        behavior: behavior,
      ),
    );
  }
}
