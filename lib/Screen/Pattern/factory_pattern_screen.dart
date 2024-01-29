import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FactoryPatternScreen extends StatelessWidget {
  const FactoryPatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CarType type = CarType.g90;
    Car(type).getPrice();
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory 패턴'),
      ),
      body: Column(
        children: [
          PlatformButton(PlatformTarget.android).build(
            () {
              print('Android Button!!');
            },
            Container(
              width: MediaQuery.of(context).size.width / 2 - 40,
              color: Colors.amber,
              child: const Center(
                child: Text('Android Button'),
              ),
            ),
          ),
          PlatformButton(PlatformTarget.ios).build(() {
            print('IOS Button');
          },
              Container(
                width: MediaQuery.of(context).size.width / 2 - 40,
                color: Colors.amber,
                child: const Center(
                  child: Text('IOS Button'),
                ),
              ))
        ],
      ),
    );
  }
}

enum PlatformTarget {
  android,
  ios;
}

abstract class PlatformButton {
  Widget build(VoidCallback onPressed, Widget child);

  factory PlatformButton(PlatformTarget target) {
    switch (target) {
      case PlatformTarget.android:
        return AndroidButton();
      case PlatformTarget.ios:
        return IOSButton();
      default:
        return AndroidButton();
    }
  }
}

// 안드로이브 버튼
class AndroidButton implements PlatformButton {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

// IOS 버튼
class IOSButton implements PlatformButton {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }
}

// ===============

abstract class Car {
  void getPrice();

  factory Car(CarType type) {
    switch (type) {
      case CarType.g70:
        return GenesisG70();
      case CarType.g80:
        return GenesisG80();
      case CarType.g90:
        return GenesisG90();
    }
  }
}

class GenesisG70 implements Car {
  final int price = 5000;

  @override
  void getPrice() {
    print('==============');
    print('Price : $price');
  }
}

class GenesisG80 implements Car {
  final int price = 8000;

  @override
  void getPrice() {
    print('==============');
    print('Price : $price');
  }
}

class GenesisG90 implements Car {
  final int price = 14000;

  @override
  void getPrice() {
    print('==============');
    print('Price : $price');
  }
}

enum CarType {
  g70,
  g80,
  g90,
}
