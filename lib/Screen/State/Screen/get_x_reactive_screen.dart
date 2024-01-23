import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_test/Screen/State/Screen/count_screen_public_ui.dart';

class CountAppGet extends GetxController {
  RxInt rxCount = 0.obs;
  RxInt rxSelectCount = 1.obs;

  void changeCount(int number) => rxSelectCount.value = number;
  void increment() => rxCount.value = rxCount.value + rxSelectCount.value;
  void decremnet() => rxCount.value = rxCount.value - rxSelectCount.value;
  void reset() => rxCount.value = 0;
}

class GetXReactiveScreen extends StatelessWidget {
  const GetXReactiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountAppGet());
    CountAppGet _controller = Get.find<CountAppGet>();

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Reactive'),
      ),
      body: Obx(() => countScreenPublicUI(
          context: context,
          count: _controller.rxCount.value,
          selectCount: _controller.rxSelectCount.value,
          onIncrement: () {
            HapticFeedback.mediumImpact();
            _controller.increment();
          },
          onDecrement: () {
            HapticFeedback.mediumImpact();
            _controller.decremnet();
          },
          onReset: () {
            HapticFeedback.mediumImpact();
            _controller.reset();
          },
          onCount: (int number) {
            HapticFeedback.mediumImpact();
            _controller.changeCount(number);
          })),
    );
  }
}
