import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:ui_test/Screen/Animation/HeroAnimation/photo_hero.dart';

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text('Hero Animation'),
                  // Image.asset('assets/images/puppy.jpg'),
                  HeroAnimation(),
                ],
              ),
              Column(
                children: [
                  Text('Radial hero animations'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
