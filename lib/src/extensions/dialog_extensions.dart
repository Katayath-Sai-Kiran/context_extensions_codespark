import 'package:flutter/material.dart';

/// Extensions for showing dialogs from BuildContext.
///
/// Example:
/// ```dart
/// await context.showAlertDialog(
///   title: 'Notice',
///   message: 'Your session has expired.',
/// );
/// ```
extension ContextDialogExtensions on BuildContext {
  /// Shows a simple alert dialog with a title and message.
  ///
  /// [title]: The title of the dialog.
  /// [message]: The body message of the dialog.
  /// [confirmLabel]: Label for the confirm button (default: 'OK').
  /// [barrierDismissible]: Whether tapping outside dismisses the dialog (default: true).
  ///
  /// Example:
  /// ```dart
  /// await context.showAlertDialog(
  ///   title: 'Notice',
  ///   message: 'Changes saved successfully.',
  ///   confirmLabel: 'Got it',
  /// );
  /// ```
  Future<void> showAlertDialog({
    required String title,
    required String message,
    String confirmLabel = 'OK',
    bool barrierDismissible = true,
  }) {
    return showDialog<void>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  /// Shows a confirmation dialog with confirm and cancel buttons.
  ///
  /// Returns `true` if the user confirms, `false` if they cancel or dismiss.
  ///
  /// [title]: The title of the dialog.
  /// [message]: The body message of the dialog.
  /// [confirmLabel]: Label for the confirm button (default: 'Confirm').
  /// [cancelLabel]: Label for the cancel button (default: 'Cancel').
  /// [isDestructive]: If true, the confirm button is styled in red (default: false).
  /// [barrierDismissible]: Whether tapping outside dismisses the dialog (default: false).
  ///
  /// Example:
  /// ```dart
  /// final confirmed = await context.showConfirmDialog(
  ///   title: 'Delete Account',
  ///   message: 'This action cannot be undone. Are you sure?',
  ///   confirmLabel: 'Delete',
  ///   isDestructive: true,
  /// );
  /// if (confirmed) {
  ///   // proceed with deletion
  /// }
  /// ```
  Future<bool> showConfirmDialog({
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
    bool barrierDismissible = false,
  }) async {
    final result = await showDialog<bool>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelLabel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: isDestructive
                ? TextButton.styleFrom(foregroundColor: Colors.red)
                : null,
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Shows a loading dialog with a spinner and optional message.
  ///
  /// Dismiss it by calling [hideDialog].
  ///
  /// [message]: Optional message displayed below the spinner (default: 'Loading...').
  /// [barrierDismissible]: Whether tapping outside dismisses the dialog (default: false).
  ///
  /// Example:
  /// ```dart
  /// context.showLoadingDialog();
  /// await Future.delayed(Duration(seconds: 2));
  /// context.hideDialog();
  /// ```
  void showLoadingDialog({
    String message = 'Loading...',
    bool barrierDismissible = false,
  }) {
    showDialog<void>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => PopScope(
        canPop: barrierDismissible,
        child: AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 16),
              Expanded(child: Text(message)),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows a custom dialog with a fully custom widget.
  ///
  /// [builder]: A builder function returning the dialog widget.
  /// [barrierDismissible]: Whether tapping outside dismisses the dialog (default: true).
  ///
  /// Example:
  /// ```dart
  /// await context.showCustomDialog(
  ///   builder: (context) => MyCustomDialogWidget(),
  /// );
  /// ```
  Future<T?> showCustomDialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  /// Dismisses the currently shown dialog.
  ///
  /// Example:
  /// ```dart
  /// context.hideDialog();
  /// ```
  void hideDialog() => Navigator.of(this).pop();
}
