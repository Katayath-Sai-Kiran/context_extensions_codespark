import 'package:flutter/widgets.dart';

/// Extensions for lifecycle and frame scheduling from BuildContext.
///
/// Example:
/// ```dart
/// context.onPostFrame(() { /* do something after build */ });
/// context.onPostFrames(3, () { /* do something after 3 frames */ });
/// ```
extension ContextLifecycleExtensions on BuildContext {
  /// Runs a callback after the current frame is rendered.
  ///
  /// This is a clean shorthand for:
  /// ```dart
  /// WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  /// ```
  ///
  /// Useful for running code that depends on the widget tree being fully built,
  /// such as scrolling to a position, showing a dialog, or measuring a widget.
  ///
  /// Example:
  /// ```dart
  /// context.onPostFrame(() {
  ///   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  /// });
  /// ```
  void onPostFrame(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }

  /// Runs a callback after [count] frames have been rendered.
  ///
  /// Each frame schedules the next until [count] reaches zero.
  /// Useful when a single post-frame is not enough for the widget tree
  /// to fully settle (e.g. after multiple nested rebuilds).
  ///
  /// Example:
  /// ```dart
  /// // Wait 2 frames before measuring a widget
  /// context.onPostFrames(2, () {
  ///   final box = myKey.currentContext?.findRenderObject() as RenderBox?;
  ///   print(box?.size);
  /// });
  /// ```
  void onPostFrames(int count, VoidCallback callback) {
    assert(count > 0, 'count must be greater than 0');
    if (count == 1) {
      onPostFrame(callback);
    } else {
      onPostFrame(() => onPostFrames(count - 1, callback));
    }
  }

  /// Returns true if this [BuildContext] is still mounted in the widget tree.
  ///
  /// Equivalent to checking [BuildContext.mounted], which was introduced in
  /// Flutter 3.7. Use this before calling `setState` or navigation methods
  /// inside async gaps to avoid acting on a disposed context.
  ///
  /// Source: Flutter [BuildContext.mounted] docs —
  /// https://api.flutter.dev/flutter/widgets/BuildContext/mounted.html
  ///
  /// Example:
  /// ```dart
  /// await Future.delayed(const Duration(seconds: 2));
  /// if (context.isContextMounted) {
  ///   context.showSuccess('Done!');
  /// }
  /// ```
  bool get isContextMounted => mounted;

  /// Runs [callback] only if this [BuildContext] is still mounted.
  ///
  /// A safe wrapper around [isContextMounted] to avoid boilerplate
  /// `if (mounted)` checks after async operations.
  ///
  /// Example:
  /// ```dart
  /// await uploadFile();
  /// context.ifMounted(() => context.showSuccess('Uploaded!'));
  /// ```
  void ifMounted(VoidCallback callback) {
    if (mounted) callback();
  }

  /// Runs a callback after the current frame, but only if the context
  /// is still mounted at the time of execution.
  ///
  /// Combines [onPostFrame] and [ifMounted] — useful in `initState`
  /// or after async operations.
  ///
  /// Example:
  /// ```dart
  /// context.onPostFrameIfMounted(() {
  ///   context.showInfo('Welcome back!');
  /// });
  /// ```
  void onPostFrameIfMounted(VoidCallback callback) {
    onPostFrame(() => ifMounted(callback));
  }
}
