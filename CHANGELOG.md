## 1.4.0

### README
- Merged "Perfect For" and "Common Use Cases" sections into a single side-by-side two-column table for better scannability and reduced scroll length


## 1.3.0

### New — Navigation Extensions (`ContextNavigationExtensions`)
- `context.push(route)` — shorthand for `Navigator.of(context).push(route)`
- `context.pop([result])` — shorthand for `Navigator.of(context).pop(result)`
- `context.pushNamed(name, {arguments})` — shorthand for `Navigator.of(context).pushNamed(...)`
- `context.pushReplacement(route)` — replaces the current route
- `context.pushReplacementNamed(name)` — named variant of `pushReplacement`
- `context.pushAndRemoveUntil(route, predicate)` — clears stack and pushes new route
- `context.popUntil(predicate)` — pops routes until predicate is met
- `context.popUntilFirst()` — pops all routes back to the root
- `context.maybePop()` — safe pop, no-op if nothing to pop
- `context.canPop` — returns `true` if there is a route to pop

### README
- Removed redundant screenshots: `snackbar_2`, `snackbar_4`, `typography`, `dialog_1`, `dialog_3`, `theme_colors`
- Rearranged screenshots into clean 3-column tables: Screen/Device/Orientation and Snackbars/Dialogs
- Added Navigation Extensions section with before/after examples and common use cases


## 1.2.0

### SEO & Package Discoverability
- Added `topics` to `pubspec.yaml` for better pub.dev search indexing:
  `buildcontext`, `responsive-design`, `flutter-extensions`, `mediaquery`, `flutter-utils`
- Added `homepage`, `repository`, and `issue_tracker` fields to `pubspec.yaml`
- Improved `description` in `pubspec.yaml` — more keyword-rich and within pub.dev's recommended character range
- Added `screenshots:` section in `pubspec.yaml` — pub.dev now displays 8 screenshots on the package page

### README
- Added shields.io badges: pub version, pub points, pub likes, license, platform, package category
- Added centered author credit — Built with ❤️ by [Katayath Sai Kiran](https://ksaikiran.dev)
- Added screenshots gallery (table layout) placed after badges and before Installation — optimal position for first-time visitors
- Replaced GitHub stars badge with more relevant `platform: flutter` and `BuildContext utilities` badges

### Documentation
- Added reusable prompt for applying badges, screenshots, author credit, and CHANGELOG updates to any Flutter package


## 1.1.0

### New — Focus Extensions
- `nextFocus()` — moves focus to the next widget (equivalent to Tab key)
- `previousFocus()` — moves focus to the previous widget (Shift+Tab)
- `requestFocus(node)` — programmatically focuses a specific `FocusNode`
- `focusScopeNode` — returns the nearest `FocusScopeNode`
- `isScopeFocused` — true if any child of the nearest scope is focused
- `hasAnyFocus` — true if any widget in the app is currently focused
- `primaryFocusNode` — returns the globally focused `FocusNode`, or null

### New — Typography Extensions
- `fontScale` — current system font scale factor (e.g. `1.0`, `1.5`)
- `scaled(style)` — applies current `TextScaler` to a given `TextStyle`
- `adaptiveStyle(mobile:, desktop:)` — returns different styles based on screen width

### New — Lifecycle Extensions
- `onPostFrames(count, callback)` — waits `n` frames before running callback
- `isContextMounted` — named accessor for `context.mounted`
- `ifMounted(callback)` — runs callback only if context is still mounted
- `onPostFrameIfMounted(callback)` — combines post-frame + mounted check (safest async pattern)

### New — Breakpoints (`context_breakpoints.dart`)
- Extracted `ContextBreakpointExtensions` into `context_breakpoints.dart` alongside `ContextBreakpoints` constants
- Added `isExpanded` — width 840–1199 dp (M3 Expanded window size class)
- Added `isExtraLarge` — width >= 1600 dp (M3 Extra Large window size class)
- All 5 M3 window size classes now covered: Compact, Medium, Expanded, Large, ExtraLarge
- Source reference added: [m3.material.io/foundations/layout/applying-layout/window-size-classes](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)

### New — Device Extensions
- `isHighDensityDisplay` — `devicePixelRatio > 2.0` (source: Flutter `MediaQueryData` docs)
- `hasNotch` — `safeTop > 24.0` (source: iOS HIG safe areas)
- `hasHomeIndicator` — `safeBottom > 0.0` (source: iOS HIG home indicator)
- `isNativeMobile` — `isAndroid || isIOS`
- `isNativeDesktop` — `isMacOS || isWindows || isLinux`
- `isTouchDevice` — Android / iOS / Fuchsia (same grouping Flutter uses internally)
- `isPointerDevice` — macOS / Windows / Linux / web
- `isFuchsia` — guarded with `kIsWeb`

### Improved — Theme Extensions
- Removed `surfaceVariantColor` (deprecated in Flutter 3.18) — replaced with `surfaceTintColor`
- Marked `backgroundColor` and `onBackgroundColor` as `@Deprecated` with migration guidance
- Added `onPrimaryColor`, `onSecondaryColor`, `onSurfaceColor`, `onErrorColor`, `scrimColor`, `shadowColor`, `tertiaryColor`, `onTertiaryColor`, `outlineColor`, `inverseSurfaceColor`

### Code Quality
- Fixed `unnecessary_library_name` analyzer warning in barrel file
- Replaced deprecated `textScaleFactor` with `textScaler`
- Replaced deprecated `colorScheme.background` with `colorScheme.surface`
- All platform-specific getters (`isAndroid`, `isIOS`, etc.) guarded with `kIsWeb`
- `dart analyze` — zero issues


## 1.0.0

### Initial Release

#### MediaQuery Extensions (`ContextMediaQueryExtensions`)
- `width`, `height`, `safeTop`, `safeBottom`, `safeLeft`, `safeRight`
- `bottomInset`, `padding`, `viewPadding`, `devicePixelRatio`
- `platformBrightness`, `textScaler`, `alwaysUse24HourFormat`
- `disableAnimations`, `invertColors`, `accessibleNavigation`, `boldText`

#### Device & Responsive (`ContextBreakpointExtensions`)
- `isMobile`, `isTablet`, `isDesktop` using `ContextBreakpoints` constants

#### Theme Extensions (`ContextThemeExtensions`)
- `theme`, `colorScheme`, `isDarkMode`, `isLightMode`
- `primaryColor`, `secondaryColor`, `surfaceColor`, `errorColor`, `outlineColor`

#### Typography Extensions (`ContextTypographyExtensions`)
- All 15 Material text styles: `displayLarge` → `labelSmall`
- Null-safe fallback — returns `TextStyle()` instead of forcing `!`

#### Snackbar Extensions (`ContextSnackbarExtensions`)
- `showSnackBar`, `showSuccess`, `showError`, `showInfo`, `hideCurrentSnackBar`

#### Dialog Extensions (`ContextDialogExtensions`)
- `showAlertDialog`, `showConfirmDialog`, `showLoadingDialog`, `showCustomDialog`, `hideDialog`

#### Focus Extensions (`ContextFocusExtensions`)
- `unfocus`, `nextFocus`, `hasPrimaryFocus`, `isFocused`

#### Lifecycle Extensions (`ContextLifecycleExtensions`)
- `onPostFrame(callback)`

#### Orientation Extensions (`ContextOrientationExtensions`)
- `isPortrait`, `isLandscape`, `orientation`, `valueByOrientation`