import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FireworkScreen extends StatefulWidget {
  @override
  _FireworkScreenState createState() => _FireworkScreenState();
}

class _FireworkScreenState extends State<FireworkScreen> {
  List<Firework> fireworks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          for (var firework in fireworks)
            Positioned(
              left: firework.x,
              top: firework.y,
              child: FireworkParticle(color: firework.color),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 불꽃놀이 시작
          launchFireworks();
        },
        child: Text('asdasd'),
      ),
    );
  }

  void launchFireworks() {
    for (int i = 0; i < 5; i++) {
      fireworks.add(
        Firework(
          x: Random().nextInt(300).toDouble(),
          y: 400,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
      );
    }

    // 일정 시간이 지난 후 불꽃놀이 종료
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        fireworks.clear();
      });
    });
  }
}

class Firework {
  final double x;
  final double y;
  final Color color;

  Firework({
    required this.x,
    required this.y,
    required this.color,
  });
}

class FireworkParticle extends StatefulWidget {
  final Color color;

  const FireworkParticle({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  _FireworkParticleState createState() => _FireworkParticleState();
}

class _FireworkParticleState extends State<FireworkParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
