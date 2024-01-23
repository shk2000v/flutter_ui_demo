import 'package:flutter/material.dart';
import 'package:ui_test/Screen/State/Screen/get_x_reactive_screen.dart';
import 'package:ui_test/Screen/State/Screen/get_x_screen.dart';
import 'package:ui_test/Screen/State/Screen/provider_screen.dart';
import 'package:ui_test/Screen/State/Screen/value_listenable.dart';

class StateManageScreen extends StatelessWidget {
  const StateManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상태관리 예시'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ValueListenable(),
                  ));
                },
                child: Text('ValueListenable 관리'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GetXScreen(),
                  ));
                },
                child: Text('GetX 관리 [simple]'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GetXReactiveScreen(),
                  ));
                },
                child: Text('GetX 관리 [reactive]'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProviderScreen(),
                  ));
                },
                child: Text('Provider 화면'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
