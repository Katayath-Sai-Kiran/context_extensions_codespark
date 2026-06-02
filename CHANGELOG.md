## 1.0.0

### Focus & Keyboard
- Extended `ContextFocusExtensions` with `nextFocus()`, `previousFocus()`, `requestFocus(node)`.
- Added `focusScopeNode`, `isScopeFocused`, `hasAnyFocus`, `primaryFocusNode` getters.

### Typography
- Extended `ContextTypographyExtensions` with `fontScale`, `scaled(style)`, `adaptiveStyle(mobile:, desktop:)`.
- Added section dividers for display, headline, title, body, label groups.

### Lifecycle
- Extended `ContextLifecycleExtensions` with `onPostFrames(count, callback)` for multi-frame delays.
- Added `isContextMounted` getter (wraps `BuildContext.mounted`).
- Added `ifMounted(callback)` — safe async-gap guard.
- Added `onPostFrameIfMounted(callback)` — post-frame + mount safety combined.

### Device & Breakpoints
- Moved all window-size-class getters (`isMobile`, `isTablet`, `isExpanded`, `isDesktop`, `isExtraLarge`) into `ContextBreakpointExtensions` in `context_breakpoints.dart`, co-located with `ContextBreakpoints` constants.
- `ContextBreakpoints` now covers all 5 M3 size classes: compact, medium, expanded, large, extra-large, with proper start/end bounds.
- Added `isHighDensityDisplay`, `hasNotch`, `hasHomeIndicator` display hints (all via MediaQuery — no platform API).
- Added `isFuchsia`, `isNativeMobile`, `isNativeDesktop`, `isTouchDevice`, `isPointerDevice` platform helpers.
- `context_breakpoints.dart` is now a standalone, self-contained file exported from the barrel.

### Theme
- Added `@Deprecated` annotations to `surfaceVariantColor` and `onBackgroundColor` with replacement guidance.

### Code Quality
- Removed redundant `import 'package:flutter/widgets.dart'` from `media_query_extensions.dart`.
- All files pass `dart analyze` with zero issues.

### Documentation
- Fully rewrote README with **before/after** code comparisons for every extension.
- Added doc comments with source references (M3 spec, Flutter API docs, Android density guide, iOS HIG) to breakpoint and device extension files.

---

## 1.0.0

- Added dialog extensions: `showAlertDialog`, `showConfirmDialog`, `showLoadingDialog`, `showCustomDialog`, `hideDialog`.
- Snackbar methods now accept `duration`, `action`, `backgroundColor`, `textColor`, and `behavior` parameters.
- Added platform detection helpers: `isAndroid`, `isIOS`, `isWeb`, `isMacOS`, `isWindows`, `isLinux` — all web-safe via `kIsWeb` guard.
- Added more MediaQuery properties: `textScaler`, `orientation`, `platformBrightness`, `devicePixelDensity`.
- Added more ColorScheme color helpers: `onPrimaryColor`, `onSecondaryColor`, `onSurfaceColor`, `onErrorColor`, `tertiaryColor`, `onTertiaryColor`, `surfaceTintColor`, `scrimColor`, `shadowColor`, `inverseSurfaceColor`.
- Deprecated `backgroundColor` (use `surfaceColor`) and `onBackgroundColor` (use `onSurfaceColor`) per Flutter 3.18.
- Deprecated `surfaceVariantColor` (use `surfaceTintColor`) per Flutter 3.18.
- Removed unnecessary `library` directive from barrel file.
- Updated README with real-world examples for all extensions.

## 0.0.1+patch-deprecated

- Fixed deprecated background property on ColorScheme.

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


