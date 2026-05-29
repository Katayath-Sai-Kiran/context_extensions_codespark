# context_extensions_codespark

A lightweight Flutter package that provides powerful and convenient `BuildContext` extensions to reduce boilerplate and improve developer productivity.

Built for Flutter developers who want cleaner, more readable code.

---

## Features

* Screen & MediaQuery utilities
* Theme & Color shortcuts
* Typography helpers
* Responsive sizing utilities
* Navigation extensions
* Snackbar helpers
* Dialog utilities
* Focus management
* Orientation helpers
* Post-frame callbacks

---

## Installation

Add the dependency:

```yaml
dependencies:
  context_extensions_codespark: latest
```

Install packages:

```bash
flutter pub get
```

Import:

```dart
import 'package:context_extensions_codespark/context_extensions_codespark.dart';
```

---

## Screen Utilities

```dart
context.screenWidth;
context.screenHeight;

context.isPortrait;
context.isLandscape;

context.isMobile;
context.isTablet;
context.isDesktop;
```

---

## Responsive Helpers

```dart
context.wp(0.8); // 80% width
context.hp(0.5); // 50% height
```

---

## Theme Helpers

```dart
context.theme;
context.colorScheme;
context.textTheme;

context.isDarkMode;
context.isLightMode;

context.primaryColor;
context.surfaceColor;
context.backgroundColor;
```

---

## Typography Helpers

```dart
context.titleLarge;
context.bodyMedium;
context.labelSmall;
```

---

## Navigation

```dart
context.push(HomePage());

context.pushNamed('/home');

context.pushReplacement(HomePage());

context.pushAndRemoveUntil(HomePage());

context.pop();

context.maybePop();

final result = await context.pushForResult<String>(
  DetailsPage(),
);
```

---

## Snackbars

```dart
context.showSnackBar('Hello');

context.showSuccess('Saved successfully');

context.showError('Something went wrong');

context.showInfo('Profile updated');
```

---

## Dialogs

```dart
await context.showAlertDialog(
  title: 'Notice',
  message: 'Changes saved successfully',
);
```

Confirmation dialog:

```dart
final confirmed = await context.showConfirmDialog(
  title: 'Delete',
  message: 'Are you sure?',
);
```

---

## Focus Utilities

```dart
context.unfocus();
```

---

## Post Frame Callback

```dart
context.onPostFrame(() {
  // Execute after build
});
```

---

## Orientation Helpers

```dart
context.valueByOrientation(
  portrait: 16.0,
  landscape: 24.0,
);
```

---

## Additional Packages

More Flutter utilities are available from K Sai Kiran at:

https://ksaikiran.dev

---
