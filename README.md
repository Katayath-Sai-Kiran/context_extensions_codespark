# context_extensions_codespark

<p align="center">
A lightweight Flutter package that provides BuildContext extensions, MediaQuery helpers, responsive design utilities, snackbar helpers, dialog helpers, theme shortcuts, typography utilities, keyboard management, and platform detection to reduce boilerplate and improve developer productivity.
</p>

<p align="center">
  Built by <a href="https://ksaikiran.dev">Katayath Sai Kiran</a> · <a href="https://github.com/Katayath-Sai-Kiran">@Katayath-Sai-Kiran</a>
</p>

<p align="center">
  <a href="https://pub.dev/packages/context_extensions_codespark">
    <img src="https://img.shields.io/pub/v/context_extensions_codespark.svg" alt="pub version"/>
  </a>
  <a href="https://pub.dev/packages/context_extensions_codespark/score">
    <img src="https://img.shields.io/pub/points/context_extensions_codespark" alt="pub points"/>
  </a>
  <a href="https://pub.dev/packages/context_extensions_codespark/score">
    <img src="https://img.shields.io/pub/likes/context_extensions_codespark" alt="pub likes"/>
  </a>
  <a href="https://github.com/Katayath-Sai-Kiran/context_extensions_codespark/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/Katayath-Sai-Kiran/context_extensions_codespark" alt="license"/>
  </a>
  <img src="https://img.shields.io/badge/platform-flutter-02569B?logo=flutter" alt="platform flutter"/>
  <img src="https://img.shields.io/badge/BuildContext-utilities-blueviolet" alt="BuildContext utilities"/>
</p>

## Perfect For

- BuildContext extensions
- MediaQuery shortcuts
- Responsive Flutter layouts
- Adaptive UI development
- Snackbar helpers
- Dialog helpers
- Theme access shortcuts
- Typography utilities
- Keyboard management
- Platform detection
- Flutter productivity
- Reducing boilerplate code

## Common Use Cases

- Flutter responsive design
- MediaQuery replacements
- Adaptive layouts
- Context-based utilities
- Snackbar management
- Dialog management
- Theme access
- Typography access
- Keyboard dismissal
- Platform detection
- Screen size calculations
- Safe area calculations

## Screenshots


| Screen & MediaQuery | Device & Platform | Theme & Colors | Typography |
|:---:|:---:|:---:|:---:|
| <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/screen_mediaquery.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/device_and_platform.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/theme_colors.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/typography.png" width="180"/> |

| Snackbars | | | |
|:---:|:---:|:---:|:---:|
| <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/snackbar_1.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/snackbar_2.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/snackbar_3.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/snackbar_4.png" width="180"/> |

| Dialogs | | | Orientation |
|:---:|:---:|:---:|:---:|
| <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/dialog_1.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/dialog_2.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/dialog_3.png" width="180"/> | <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/context_extensions_codespark/master/assets/orientations.png" width="180"/> |


## Features

- Screen & MediaQuery utilities
- Theme & Color shortcuts
- Typography helpers with adaptive sizing
- Responsive device helpers (M3 window size classes)
- Snackbar helpers (with full customization)
- Dialog utilities (alert, confirm, loading, custom)
- Focus & keyboard management
- Orientation helpers
- Post-frame callbacks with mount safety
- Platform detection (web-safe)


## Flutter Responsive Design

Build responsive and adaptive Flutter UIs using simple BuildContext extensions.

- Device breakpoints
- Window size classes
- Orientation helpers
- Adaptive typography
- Responsive layouts
- Screen size utilities


## Installation

```yaml
dependencies:
  context_extensions_codespark: latest
```

```bash
flutter pub get
```

```dart
import 'package:context_extensions_codespark/context_extensions_codespark.dart';
```


## MediaQuery Extensions & Screen Size Helpers

**Without package:**
```dart
double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
double top = MediaQuery.of(context).padding.top;
double bottom = MediaQuery.of(context).padding.bottom;
double keyboard = MediaQuery.of(context).viewInsets.bottom;
```

**With package:**
```dart
double width = context.width;
double height = context.height;
double top = context.safeTop;
double bottom = context.safeBottom;
double keyboard = context.bottomInset;
```

Other available properties:
```dart
context.devicePixelRatio
context.textScaler
context.platformBrightness
context.padding
context.viewPadding
context.statusBarHeight
```


## Responsive Design & Device Helpers

Based on [Material Design 3 Window Size Classes](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).

**Without package:**
```dart
final width = MediaQuery.of(context).size.width;
final isMobile   = width < 600;
final isTablet   = width >= 600  && width < 840;
final isExpanded = width >= 840  && width < 1200;
final isDesktop  = width >= 1200 && width < 1600;
final isXL       = width >= 1600;
final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
```

**With package:**
```dart
context.isMobile      // < 600 dp   — compact (phone portrait)
context.isTablet      // 600–839 dp — medium (tablet portrait)
context.isExpanded    // 840–1199 dp — expanded (tablet landscape)
context.isDesktop     // 1200–1599 dp — large (desktop)
context.isExtraLarge  // >= 1600 dp — extra-large (ultra-wide)
context.isKeyboardOpen
```

**Display hardware hints (from MediaQuery — no platform API needed):**

**Without package:**
```dart
final isHighDensity = MediaQuery.of(context).devicePixelRatio > 2.0;
final hasNotch = MediaQuery.of(context).padding.top > 24.0;
final hasHomeBar = MediaQuery.of(context).padding.bottom > 0.0;
```

**With package:**
```dart
context.isHighDensityDisplay  // pixel ratio > 2.0
context.hasNotch              // safeTop > 24 dp
context.hasHomeIndicator      // safeBottom > 0 dp
```

**Platform detection — web-safe:**

**Without package:**
```dart
import 'dart:io';
// Throws on web!
if (Platform.isAndroid) { ... }
if (Platform.isIOS) { ... }
```

**With package (guarded with `kIsWeb` internally):**
```dart
if (context.isAndroid) { ... }
if (context.isIOS) { ... }
if (context.isWeb) { ... }
if (context.isMacOS) { ... }
if (context.isWindows) { ... }
if (context.isLinux) { ... }
if (context.isFuchsia) { ... }

// Grouped helpers
if (context.isNativeMobile) { ... }   // Android || iOS
if (context.isNativeDesktop) { ... }  // macOS || Windows || Linux
if (context.isTouchDevice) { ... }    // Android || iOS || Fuchsia
if (context.isPointerDevice) { ... }  // macOS || Windows || Linux || Web
```



## Theme Extensions & Color Shortcuts

**Without package:**
```dart
final scheme = Theme.of(context).colorScheme;
final isDark = Theme.of(context).brightness == Brightness.dark;
final primary = Theme.of(context).colorScheme.primary;
final error = Theme.of(context).colorScheme.error;
```

**With package:**
```dart
final scheme = context.colorScheme;
final isDark = context.isDarkMode;
final primary = context.primaryColor;
final error = context.errorColor;
```

Full color palette:
```dart
context.primaryColor       context.onPrimaryColor
context.secondaryColor     context.onSecondaryColor
context.tertiaryColor      context.onTertiaryColor
context.surfaceColor       context.onSurfaceColor
context.errorColor         context.onErrorColor
context.outlineColor
context.shadowColor
context.scrimColor
context.inverseSurfaceColor
context.surfaceTintColor
```


## Typography

All style getters return a safe `TextStyle()` fallback — never null, never throws.

**Without package:**
```dart
Text('Hello', style: Theme.of(context).textTheme.titleLarge);
```

**With package:**
```dart
Text('Hello', style: context.titleLarge);
```

All styles:
```dart
context.displayLarge    context.displayMedium    context.displaySmall
context.headlineLarge   context.headlineMedium   context.headlineSmall
context.titleLarge      context.titleMedium      context.titleSmall
context.bodyLarge       context.bodyMedium       context.bodySmall
context.labelLarge      context.labelMedium      context.labelSmall
```

**Font scale (system accessibility setting):**

**Without package:**
```dart
final scale = MediaQuery.of(context).textScaler.scale(1.0);
if (scale > 1.3) { /* compact layout */ }
```

**With package:**
```dart
if (context.fontScale > 1.3) { /* compact layout */ }
```

**Scale a specific style to the system font size:**

**Without package:**
```dart
final fontSize = Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14.0;
final scaled = Theme.of(context).textTheme.bodyMedium?.copyWith(
  fontSize: MediaQuery.of(context).textScaler.scale(fontSize),
);
```

**With package:**
```dart
final scaled = context.scaled(context.bodyMedium);
```

**Adapt style based on screen width:**

**Without package:**
```dart
final width = MediaQuery.of(context).size.width;
final style = width < 600
    ? Theme.of(context).textTheme.bodyMedium!
    : Theme.of(context).textTheme.titleLarge!;
```

**With package:**
```dart
final style = context.adaptiveStyle(
  mobile: context.bodyMedium,
  desktop: context.titleLarge,
);
```


## Snackbar Helpers & Context Snackbar Extensions

**Without package:**
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Saved successfully'), backgroundColor: Colors.green),
);
```

**With package:**
```dart
context.showSuccess('Saved successfully');
```

All snackbar helpers:
```dart
context.showSnackBar('Hello!');
context.showSuccess('Saved successfully');
context.showError('Something went wrong');
context.showInfo('Profile updated');
```

With custom options (all params optional):
```dart
context.showSuccess(
  'Item deleted',
  duration: const Duration(seconds: 4),
  behavior: SnackBarBehavior.floating,
  textColor: Colors.white,
  backgroundColor: Colors.green,
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () { /* restore */ },
  ),
);
```


## Dialog Helpers & Context Dialog Extensions

### Alert dialog

**Without package:**
```dart
showDialog(
  context: context,
  builder: (ctx) => AlertDialog(
    title: const Text('Session Expired'),
    content: const Text('Please log in again to continue.'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(ctx).pop(),
        child: const Text('OK'),
      ),
    ],
  ),
);
```

**With package:**
```dart
await context.showAlertDialog(
  title: 'Session Expired',
  message: 'Please log in again to continue.',
  confirmLabel: 'OK',
);
```

### Confirmation dialog

Returns `true` if confirmed, `false` if cancelled.

**Without package:**
```dart
final confirmed = await showDialog<bool>(
  context: context,
  builder: (ctx) => AlertDialog(
    title: const Text('Delete Account'),
    content: const Text('This action cannot be undone. Are you sure?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(ctx).pop(false),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () => Navigator.of(ctx).pop(true),
        style: TextButton.styleFrom(foregroundColor: Colors.red),
        child: const Text('Delete'),
      ),
    ],
  ),
);
if (confirmed ?? false) { /* proceed */ }
```

**With package:**
```dart
final confirmed = await context.showConfirmDialog(
  title: 'Delete Account',
  message: 'This action cannot be undone. Are you sure?',
  confirmLabel: 'Delete',
  isDestructive: true,
);
if (confirmed) { /* proceed */ }
```

### Loading dialog

**Without package:**
```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (_) => const AlertDialog(
    content: Row(children: [
      CircularProgressIndicator(),
      SizedBox(width: 16),
      Text('Uploading...'),
    ]),
  ),
);
await uploadFile();
if (context.mounted) Navigator.of(context).pop();
```

**With package:**
```dart
context.showLoadingDialog(message: 'Uploading...');
try {
  await uploadFile();
} finally {
  context.hideDialog();
}
```

### Custom dialog

```dart
await context.showCustomDialog(
  builder: (context) => MyCustomDialogWidget(),
);
```


## Focus & Keyboard

**Without package:**
```dart
FocusScope.of(context).unfocus();
FocusScope.of(context).nextFocus();
FocusScope.of(context).previousFocus();
FocusScope.of(context).requestFocus(myFocusNode);
final hasFocus = FocusScope.of(context).hasFocus;
final primaryNode = FocusManager.instance.primaryFocus;
```

**With package:**
```dart
context.unfocus();
context.nextFocus();
context.previousFocus();
context.requestFocus(myFocusNode);
context.isScopeFocused
context.hasAnyFocus
context.primaryFocusNode
context.focusScopeNode
```

**Dismiss keyboard when tapping outside a field:**
```dart
GestureDetector(
  onTap: () => context.unfocus(),
  child: Scaffold(body: TextField()),
);
```

**Navigate between fields on submit:**
```dart
TextField(
  onSubmitted: (_) => context.nextFocus(),
),
```


## Post-Frame Callbacks

Runs code after the widget tree renders. Safe replacements for `WidgetsBinding.instance.addPostFrameCallback(...)`.

**Without package:**
```dart
WidgetsBinding.instance.addPostFrameCallback((_) {
  _scrollController.animateTo(...);
});
```

**With package:**
```dart
context.onPostFrame(() {
  _scrollController.animateTo(...);
});
```

**Wait multiple frames before acting (e.g. measuring a widget after nested rebuilds):**

**Without package:**
```dart
// Messy manual chaining
WidgetsBinding.instance.addPostFrameCallback((_) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final box = myKey.currentContext?.findRenderObject() as RenderBox?;
    print(box?.size);
  });
});
```

**With package:**
```dart
context.onPostFrames(2, () {
  final box = myKey.currentContext?.findRenderObject() as RenderBox?;
  print(box?.size);
});
```

**Check if context is still mounted after async gap:**

**Without package:**
```dart
await uploadFile();
if (mounted) {
  ScaffoldMessenger.of(context).showSnackBar(...);
}
```

**With package:**
```dart
await uploadFile();
context.ifMounted(() => context.showSuccess('Uploaded!'));

// Or check manually:
if (context.isContextMounted) {
  context.showSuccess('Uploaded!');
}
```

**Post-frame + mounted safety combined:**
```dart
// Safest pattern — only runs if still mounted after the frame
context.onPostFrameIfMounted(() {
  context.showInfo('Welcome back!');
});
```


## Orientation Helpers

**Without package:**
```dart
final isPortrait = MediaQuery.of(context).size.height >
                   MediaQuery.of(context).size.width;
final padding = isPortrait ? 16.0 : 48.0;
final columns = isPortrait ? 2 : 4;
```

**With package:**
```dart
context.isPortrait
context.isLandscape

final padding = context.valueByOrientation(portrait: 16.0, landscape: 48.0);
final columns = context.valueByOrientation(portrait: 2, landscape: 4);
```

**Full adaptive grid example:**
```dart
@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: context.valueByOrientation(portrait: 16.0, landscape: 48.0),
    ),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.valueByOrientation(portrait: 2, landscape: 4),
      ),
      itemBuilder: (_, i) => ItemCard(),
      itemCount: items.length,
    ),
  );
}
```


## About

Maintained by Katayath Sai Kiran.

Website: [ksaikiran.dev](https://ksaikiran.dev)


