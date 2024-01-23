import 'package:flutter/material.dart';
import 'package:ui_test/Screen/State/value_listenable.dart';

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
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ValueListenable(),
                  ));
                },
                child: Text('ValueListenable 관리'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector countAppSelectedCountBox({
  required Function(int) onTap,
  required int number,
  required int selectNumber,
}) {
  return GestureDetector(
    onTap: () => onTap(number),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: selectNumber == number
              ? const Color.fromRGBO(91, 91, 91, 1)
              : const Color.fromRGBO(61, 61, 61, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectNumber == number
                    ? Colors.white
                    : const Color.fromRGBO(155, 155, 155, 1)),
          ),
        ),
      ),
    ),
  );
}
