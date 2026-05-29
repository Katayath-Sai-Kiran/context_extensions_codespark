import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:context_extensions_codespark/context_extensions_codespark.dart';

void main() {
  testWidgets('MediaQuery extensions return correct values', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            // Set up a MediaQuery for testing
            return MediaQuery(
              data: const MediaQueryData(size: Size(800, 600)),
              child: Builder(
                builder: (context) {
                  expect(context.width, 800);
                  expect(context.height, 600);
                  return const SizedBox();
                },
              ),
            );
          },
        ),
      ),
    );
  });

  testWidgets('Device extensions work as expected', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return MediaQuery(
              data: const MediaQueryData(size: Size(500, 800)),
              child: Builder(
                builder: (context) {
                  expect(context.isMobile, true);
                  expect(context.isTablet, false);
                  expect(context.isDesktop, false);
                  return const SizedBox();
                },
              ),
            );
          },
        ),
      ),
    );
  });

  testWidgets('Snackbar extensions show snackbars', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            context.showSuccess('Success!');
            context.showError('Error!');
            context.showInfo('Info!');
            context.showSnackBar('Snack!');
            return const SizedBox();
          },
        ),
      ),
    );
    // No exceptions = pass
  });
}
