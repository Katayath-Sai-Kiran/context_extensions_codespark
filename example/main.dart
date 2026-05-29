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

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Context Extensions Example')),
      body: Padding(
        padding: EdgeInsets.all(
          context.valueByOrientation(portrait: 16, landscape: 32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Screen width: ${context.width}', style: context.bodyLarge),
            Text('Is Mobile: ${context.isMobile}', style: context.bodyMedium),
            Text('Is Tablet: ${context.isTablet}', style: context.bodyMedium),
            Text('Is Desktop: ${context.isDesktop}', style: context.bodyMedium),
            Text(
              'Is Dark Mode: ${context.isDarkMode}',
              style: context.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  context.showSuccess('This is a success message!'),
              child: const Text('Show Success Snackbar'),
            ),
            ElevatedButton(
              onPressed: () => context.showError('This is an error message!'),
              child: const Text('Show Error Snackbar'),
            ),
            ElevatedButton(
              onPressed: () => context.showInfo('This is an info message!'),
              child: const Text('Show Info Snackbar'),
            ),
            ElevatedButton(
              onPressed: () => context.unfocus(),
              child: const Text('Unfocus'),
            ),
          ],
        ),
      ),
    );
  }
}
