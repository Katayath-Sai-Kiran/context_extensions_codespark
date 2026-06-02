import 'package:flutter/material.dart';
import 'package:context_extensions_codespark/context_extensions_codespark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Extensions Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleHomePage(),
    );
  }
}

// ─────────────────────────────────────────────
// Home page — navigates into each section
// ─────────────────────────────────────────────
class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      ('Screen & MediaQuery', const ScreenInfoPage()),
      ('Device & Platform', const DevicePage()),
      ('Theme & Colors', const ThemePage()),
      ('Typography', const TypographyPage()),
      ('Snackbars', const SnackbarPage()),
      ('Dialogs', const DialogPage()),
      ('Focus & Keyboard', const FocusPage()),
      ('Post-Frame Callback', const PostFramePage()),
      ('Orientation', const OrientationPage()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Extensions'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final (label, page) = sections[i];
          return ListTile(
            title: Text(label, style: context.titleMedium),
            trailing: const Icon(Icons.chevron_right),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: context.outlineColor),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 1. Screen & MediaQuery
// ─────────────────────────────────────────────
class ScreenInfoPage extends StatelessWidget {
  const ScreenInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen & MediaQuery')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Row('width', '${context.width.toStringAsFixed(1)} px'),
            _Row('height', '${context.height.toStringAsFixed(1)} px'),
            _Row(
              'devicePixelRatio',
              context.devicePixelRatio.toStringAsFixed(2),
            ),
            _Row('safeTop', '${context.safeTop} px'),
            _Row('safeBottom', '${context.safeBottom} px'),
            _Row('bottomInset (keyboard)', '${context.bottomInset} px'),
            _Row('padding', context.padding.toString()),
            _Row('viewPadding', context.viewPadding.toString()),
            _Row('platformBrightness', context.platformBrightness.name),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 2. Device & Platform
// ─────────────────────────────────────────────
class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device & Platform')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Breakpoints', style: context.titleMedium),
            const SizedBox(height: 8),
            _Row('isMobile  (width < 600)', '${context.isMobile}'),
            _Row('isTablet  (600 – 1200)', '${context.isTablet}'),
            _Row('isDesktop (width >= 1200)', '${context.isDesktop}'),
            _Row('isKeyboardOpen', '${context.isKeyboardOpen}'),
            const Divider(height: 32),
            Text('Platform (web-safe)', style: context.titleMedium),
            const SizedBox(height: 8),
            _Row('isAndroid', '${context.isAndroid}'),
            _Row('isIOS', '${context.isIOS}'),
            _Row('isWeb', '${context.isWeb}'),
            _Row('isMacOS', '${context.isMacOS}'),
            _Row('isWindows', '${context.isWindows}'),
            _Row('isLinux', '${context.isLinux}'),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 3. Theme & Colors
// ─────────────────────────────────────────────
class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = {
      'primaryColor': context.primaryColor,
      'secondaryColor': context.secondaryColor,
      'tertiaryColor': context.tertiaryColor,
      'surfaceColor': context.surfaceColor,
      'errorColor': context.errorColor,
      'outlineColor': context.outlineColor,
      'shadowColor': context.shadowColor,
      'scrimColor': context.scrimColor,
      'inverseSurfaceColor': context.inverseSurfaceColor,
      'surfaceTintColor': context.surfaceTintColor,
      'onPrimaryColor': context.onPrimaryColor,
      'onSecondaryColor': context.onSecondaryColor,
      'onSurfaceColor': context.onSurfaceColor,
      'onErrorColor': context.onErrorColor,
      'onTertiaryColor': context.onTertiaryColor,
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Theme & Colors')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  context.isDarkMode ? '🌙 Dark Mode' : '☀️ Light Mode',
                  style: context.titleMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: colors.length,
              itemBuilder: (_, i) {
                final label = colors.keys.elementAt(i);
                final color = colors.values.elementAt(i);
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.outlineColor),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          ThemeData.estimateBrightnessForColor(color) ==
                              Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 4. Typography
// ─────────────────────────────────────────────
class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('displayLarge', style: context.displayLarge),
          Text('displayMedium', style: context.displayMedium),
          Text('displaySmall', style: context.displaySmall),
          const Divider(),
          Text('headlineLarge', style: context.headlineLarge),
          Text('headlineMedium', style: context.headlineMedium),
          Text('headlineSmall', style: context.headlineSmall),
          const Divider(),
          Text('titleLarge', style: context.titleLarge),
          Text('titleMedium', style: context.titleMedium),
          Text('titleSmall', style: context.titleSmall),
          const Divider(),
          Text('bodyLarge', style: context.bodyLarge),
          Text('bodyMedium', style: context.bodyMedium),
          Text('bodySmall', style: context.bodySmall),
          const Divider(),
          Text('labelLarge', style: context.labelLarge),
          Text('labelMedium', style: context.labelMedium),
          Text('labelSmall', style: context.labelSmall),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 5. Snackbars
// ─────────────────────────────────────────────
class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => context.showSnackBar('Basic snackbar message'),
              child: const Text('showSnackBar'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.showSuccess('Profile saved!'),
              child: const Text('showSuccess'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.showError('Upload failed.'),
              child: const Text('showError'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.showInfo('New update available.'),
              child: const Text('showInfo'),
            ),
            const Divider(height: 32),
            ElevatedButton(
              onPressed: () => context.showSuccess(
                'Item deleted',
                duration: const Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () => context.showInfo('Undo triggered'),
                ),
              ),
              child: const Text('showSuccess — with Undo action'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.showError(
                'Payment failed',
                backgroundColor: Colors.deepOrange,
                textColor: Colors.white,
                behavior: SnackBarBehavior.floating,
              ),
              child: const Text('showError — custom colors'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 6. Dialogs
// ─────────────────────────────────────────────
class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => context.showAlertDialog(
                title: 'Session Expired',
                message: 'Please log in again to continue.',
                confirmLabel: 'Got it',
              ),
              child: const Text('showAlertDialog'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final confirmed = await context.showConfirmDialog(
                  title: 'Delete Account',
                  message: 'This action cannot be undone. Are you sure?',
                  confirmLabel: 'Delete',
                  cancelLabel: 'Cancel',
                  isDestructive: true,
                );
                if (confirmed && context.mounted) {
                  context.showSuccess('Account deleted');
                }
              },
              child: const Text('showConfirmDialog (destructive)'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                context.showLoadingDialog(message: 'Uploading file...');
                await Future.delayed(const Duration(seconds: 2));
                if (context.mounted) {
                  context.hideDialog();
                  context.showSuccess('Upload complete!');
                }
              },
              child: const Text('showLoadingDialog → hideDialog'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.showCustomDialog(
                builder: (ctx) => AlertDialog(
                  title: const Text('Custom Dialog'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 48, color: Colors.amber),
                      const SizedBox(height: 8),
                      const Text('This is a fully custom dialog widget.'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => ctx.hideDialog(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
              child: const Text('showCustomDialog'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 7. Focus & Keyboard
// ─────────────────────────────────────────────
class FocusPage extends StatelessWidget {
  const FocusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus & Keyboard')),
      body: GestureDetector(
        // Tap anywhere outside the TextField to dismiss the keyboard
        onTap: () => context.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tap outside the text field to unfocus and hide the keyboard.',
                style: context.bodyMedium,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Type something...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.unfocus(),
                child: const Text('Unfocus manually'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 8. Post-Frame Callback
// ─────────────────────────────────────────────
class PostFramePage extends StatefulWidget {
  const PostFramePage({super.key});

  @override
  State<PostFramePage> createState() => _PostFramePageState();
}

class _PostFramePageState extends State<PostFramePage> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _messages = List.generate(20, (i) => 'Message ${i + 1}');

  void _addMessageAndScroll() {
    setState(() {
      _messages.add('Message ${_messages.length + 1}');
    });

    // After the list rebuilds, scroll to the bottom
    context.onPostFrame(() {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post-Frame Callback')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Tap the button to add a message. The list auto-scrolls to the bottom using context.onPostFrame().',
              style: context.bodySmall,
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (_, i) => ListTile(
                leading: const Icon(Icons.chat_bubble_outline),
                title: Text(_messages[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: _addMessageAndScroll,
              icon: const Icon(Icons.add),
              label: const Text('Add message & scroll to bottom'),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 9. Orientation
// ─────────────────────────────────────────────
class OrientationPage extends StatelessWidget {
  const OrientationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orientation')),
      body: Padding(
        // Padding adapts to orientation using valueByOrientation
        padding: EdgeInsets.symmetric(
          horizontal: context.valueByOrientation(
            portrait: 16.0,
            landscape: 48.0,
          ),
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Row('isPortrait', '${context.isPortrait}'),
            _Row('isLandscape', '${context.isLandscape}'),
            const SizedBox(height: 24),
            Text(
              'Grid adapts columns via valueByOrientation:',
              style: context.bodyMedium,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // 2 columns portrait, 4 landscape
                  crossAxisCount: context.valueByOrientation(
                    portrait: 2,
                    landscape: 4,
                  ),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 12,
                itemBuilder: (_, i) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.primaryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.primaryColor),
                  ),
                  child: Text('Item ${i + 1}', style: context.labelLarge),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Shared helper widget
// ─────────────────────────────────────────────
class _Row extends StatelessWidget {
  const _Row(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(value, style: context.bodyMedium),
        ],
      ),
    );
  }
}
