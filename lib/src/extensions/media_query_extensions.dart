import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Extensions for accessing MediaQuery properties from BuildContext.
///
/// Example:
/// ```dart
/// double width = context.width;
/// ```
extension ContextMediaQueryExtensions on BuildContext {
  /// The width of the screen.
  ///
  /// Example:
  /// ```dart
  /// double w = context.width;
  /// ```
  double get width => MediaQuery.of(this).size.width;

  /// The height of the screen.
  double get height => MediaQuery.of(this).size.height;

  /// The device pixel ratio.
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// The text scaler for nonlinear text scaling (Flutter 3.12+).
  TextScaler get textScaler => MediaQuery.of(this).textScaler;

  /// The orientation of the device (portrait or landscape).
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// The platform brightness (light or dark).
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  /// The device's pixel density (number of device pixels for each logical pixel).
  double get devicePixelDensity => MediaQuery.of(this).devicePixelRatio;

  /// The status bar height (top padding).
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// The bottom inset (e.g., keyboard height).
  double get bottomInset => MediaQuery.of(this).viewInsets.bottom;

  /// The padding of the screen (safe area insets).
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// The view padding of the screen.
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// The safe area top padding.
  double get safeTop => MediaQuery.of(this).padding.top;

  /// The safe area bottom padding.
  double get safeBottom => MediaQuery.of(this).padding.bottom;
}
