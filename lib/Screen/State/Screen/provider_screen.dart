import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_test/Provider/count_app_provider.dart';
import 'package:ui_test/Screen/State/Screen/count_screen_public_ui.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountAppProvider>(
      create: (context) => CountAppProvider(),
      child: Consumer<CountAppProvider>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(title: Text('Provider counter Exmaple')),
            body: countScreenPublicUI(
                context: context,
                count: value.count,
                selectCount: value.selectCount,
                onIncrement: () => value.updated(true),
                onDecrement: () => value.updated(false),
                onReset: () => value.updated(null),
                onCount: (int number) => value.selected(number)),
          );
        },
      ),
    );
  }
}
