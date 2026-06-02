## 1.1.0

### Documentation & Presentation
- Rewrote README with **before/after** code comparisons for every extension category.
- Added screenshots gallery covering all 8 extension categories (Screen, Device, Theme, Typography, Snackbars, Dialogs, Orientation, Overview).
- Added badges: pub version, pub points, pub likes, license, Flutter platform, BuildContext utilities.
- Added author credit with links to website and GitHub profile.
- Added `screenshots:` section to `pubspec.yaml` for pub.dev package page display.
- Added doc comments with source references (M3 spec, Flutter API docs, Android density guide, iOS HIG).

### Focus & Keyboard
- Extended `ContextFocusExtensions` with `nextFocus()`, `previousFocus()`, `requestFocus(node)`.
- Added `focusScopeNode`, `isScopeFocused`, `hasAnyFocus`, `primaryFocusNode` getters.

### Typography
- Extended `ContextTypographyExtensions` with `fontScale`, `scaled(style)`, `adaptiveStyle(mobile:, desktop:)`.
- All style getters return a safe `TextStyle()` fallback — never null, never throws.

### Lifecycle
- Extended `ContextLifecycleExtensions` with `onPostFrames(count, callback)` for multi-frame delays.
- Added `isContextMounted` getter (wraps `BuildContext.mounted`).
- Added `ifMounted(callback)` — safe async-gap guard.
- Added `onPostFrameIfMounted(callback)` — post-frame + mount safety combined.

### Device & Breakpoints
- Moved all window-size-class getters (`isMobile`, `isTablet`, `isExpanded`, `isDesktop`, `isExtraLarge`) into `ContextBreakpointExtensions` in `context_breakpoints.dart`.
- `ContextBreakpoints` constants now covers all 5 M3 size classes with proper start/end bounds.
- Added `isHighDensityDisplay`, `hasNotch`, `hasHomeIndicator` display hints (all via MediaQuery — no platform API needed).
- Added `isFuchsia`, `isNativeMobile`, `isNativeDesktop`, `isTouchDevice`, `isPointerDevice` platform helpers.

### Theme
- Added `@Deprecated` annotations to `surfaceVariantColor` and `onBackgroundColor` with replacement guidance.

### Code Quality
- Removed redundant `import 'package:flutter/widgets.dart'` from `media_query_extensions.dart`.
- All files pass `dart analyze` with zero issues.

---

## 1.0.0

- Added dialog extensions: `showAlertDialog`, `showConfirmDialog`, `showLoadingDialog`, `showCustomDialog`, `hideDialog`.
- Snackbar methods now accept `duration`, `action`, `backgroundColor`, `textColor`, and `behavior` parameters.
- Added platform detection helpers: `isAndroid`, `isIOS`, `isWeb`, `isMacOS`, `isWindows`, `isLinux` — all web-safe via `kIsWeb` guard.
- Added `textScaler`, `orientation`, `platformBrightness`, `devicePixelRatio` MediaQuery properties.
- Added full ColorScheme color helpers: `onPrimaryColor`, `onSecondaryColor`, `onSurfaceColor`, `onErrorColor`, `tertiaryColor`, `onTertiaryColor`, `surfaceTintColor`, `scrimColor`, `shadowColor`, `inverseSurfaceColor`.
- Deprecated `backgroundColor` (use `surfaceColor`) and `onBackgroundColor` (use `onSurfaceColor`) per Flutter 3.18.
- Deprecated `surfaceVariantColor` (use `surfaceTintColor`) per Flutter 3.18.
- Removed unnecessary `library` directive from barrel file.
- Updated README with real-world examples for all extensions.

---

## 0.0.1+patch-deprecated

- Fixed deprecated `background` property on `ColorScheme`.

---

## 0.0.1

- Initial release.
- MediaQuery extensions.
- Device helpers.
- Theme extensions.
- Typography shortcuts.
- Snackbar helpers.
- Focus helpers.
- Lifecycle utilities.
- Orientation helpers.
