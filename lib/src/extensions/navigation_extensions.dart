import 'package:flutter/widgets.dart';

/// Navigation shortcuts for [BuildContext].
///
/// Eliminates the `Navigator.of(context)` boilerplate for the most common
/// navigation operations. All methods delegate directly to the nearest
/// [Navigator] in the widget tree.
///
/// Example:
/// ```dart
/// // Before
/// Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsPage()));
///
/// // After
/// context.push(MaterialPageRoute(builder: (_) => DetailsPage()));
/// ```
extension ContextNavigationExtensions on BuildContext {
  /// The nearest [NavigatorState] in the widget tree.
  NavigatorState get _navigator => Navigator.of(this);

  /// Whether there is at least one route that can be popped.
  ///
  /// Returns `false` if the current route is the root (first) route.
  bool get canPop => _navigator.canPop();

  /// Pushes [route] onto the navigator stack and returns a [Future] that
  /// completes with the value passed to [pop] when the pushed route is popped.
  ///
  /// ```dart
  /// context.push(MaterialPageRoute(builder: (_) => DetailsPage()));
  ///
  /// // With a return value:
  /// final result = await context.push<String>(
  ///   MaterialPageRoute(builder: (_) => PickerPage()),
  /// );
  /// ```
  Future<T?> push<T extends Object?>(Route<T> route) {
    return _navigator.push(route);
  }

  /// Pops the top-most route off the navigator stack.
  ///
  /// Optionally passes [result] back to the caller of [push].
  ///
  /// ```dart
  /// context.pop();
  /// context.pop('selected_value');
  /// ```
  void pop<T extends Object?>([T? result]) {
    _navigator.pop(result);
  }

  /// Pushes the route named [routeName] onto the navigator stack.
  ///
  /// ```dart
  /// context.pushNamed('/details', arguments: {'id': 42});
  /// ```
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  /// Replaces the current route with [route].
  ///
  /// Useful after a successful login — the user cannot go back to the
  /// login screen by pressing the back button.
  ///
  /// ```dart
  /// context.pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  /// ```
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> route, {
    TO? result,
  }) {
    return _navigator.pushReplacement(route, result: result);
  }

  /// Replaces the named route with [routeName].
  ///
  /// ```dart
  /// context.pushReplacementNamed('/home');
  /// ```
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return _navigator.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Pushes [route] and removes all existing routes that satisfy [predicate].
  ///
  /// Pass `(route) => false` to clear the entire stack before pushing.
  ///
  /// ```dart
  /// // Logout — clear stack and go to login
  /// context.pushAndRemoveUntil(
  ///   MaterialPageRoute(builder: (_) => LoginPage()),
  ///   (route) => false,
  /// );
  /// ```
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> route,
    RoutePredicate predicate,
  ) {
    return _navigator.pushAndRemoveUntil(route, predicate);
  }

  /// Pops routes repeatedly until [predicate] returns `true`.
  ///
  /// ```dart
  /// // Go back to the home route
  /// context.popUntil((route) => route.settings.name == '/home');
  /// ```
  void popUntil(RoutePredicate predicate) {
    _navigator.popUntil(predicate);
  }

  /// Pops all routes until the first (root) route.
  ///
  /// Equivalent to `context.popUntil((route) => route.isFirst)`.
  ///
  /// ```dart
  /// context.popUntilFirst();
  /// ```
  void popUntilFirst() {
    _navigator.popUntil((route) => route.isFirst);
  }

  /// Pops the current route if [canPop] is `true`. No-op otherwise.
  ///
  /// Safer than [pop] in situations where the route may or may not be
  /// on the stack.
  ///
  /// ```dart
  /// context.maybePop();
  /// ```
  Future<bool> maybePop<T extends Object?>([T? result]) {
    return _navigator.maybePop(result);
  }
}
