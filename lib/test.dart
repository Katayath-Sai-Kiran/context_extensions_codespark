import 'package:context_extensions_codespark/context_extensions_codespark.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.5,
      color: const Color(0xFF00FF00),
    );
  }
}
