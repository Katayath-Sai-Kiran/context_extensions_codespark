import 'package:flutter/widgets.dart';

/// Extensions for lifecycle management from BuildContext.
///
/// Example:
/// ```dart
/// context.onPostFrame(() { /* do something */ });
/// ```
extension ContextLifecycleExtensions on BuildContext {
  /// Runs a callback after the current frame is rendered.
  void onPostFrame(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }
}
