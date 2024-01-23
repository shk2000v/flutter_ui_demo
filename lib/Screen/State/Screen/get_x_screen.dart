import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_test/GetX/count_app_get.dart';
import 'package:ui_test/Screen/State/Screen/count_screen_public_ui.dart';

class GetXScreen extends StatelessWidget {
  const GetXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CountAppGet(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Count App With Get X(Simple)'),
          ),
          body: countScreenPublicUI(
              context: context,
              count: controller.count,
              selectCount: controller.selectCount,
              onIncrement: () {
                HapticFeedback.mediumImpact();
                controller.updated(true);
              },
              onDecrement: () {
                HapticFeedback.mediumImpact();
                controller.updated(false);
              },
              onReset: () {
                HapticFeedback.mediumImpact();
                controller.updated(null);
              },
              onCount: (int number) {
                HapticFeedback.mediumImpact();
                controller.selected(number);
              }),
        );
      },
    );
  }
}
