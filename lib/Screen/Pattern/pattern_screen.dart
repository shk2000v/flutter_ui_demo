import 'package:flutter/material.dart';
import 'package:ui_test/Screen/Pattern/factory_pattern_screen.dart';

class PatternScreen extends StatelessWidget {
  const PatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플러터 패턴'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FactoryPatternScreen(),
            ),
          );
        },
        child: Text('팩토리 패턴'),
      ),
    );
  }
}
