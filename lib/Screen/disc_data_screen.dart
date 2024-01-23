import 'dart:math';

import 'package:flutter/material.dart';

// Study :
// Aligment
//

class DiscData {
  static final _rng = Random();

  final double size;
  final Color color;
  final Alignment alignment;

  DiscData()
      : size = _rng.nextDouble() * 40 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

class DiscDataScreen extends StatelessWidget {
  const DiscDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Color(0xFF15202D),
        child: SizedBox.expand(
          child: VariousDiscs(50),
        ),
      ),
    );
  }
}

class VariousDiscs extends StatefulWidget {
  final int numberOfDiscs;
  const VariousDiscs(this.numberOfDiscs, {super.key});
  // const VariousDiscs({
  //   super.key,
  //   required this.numberOfDiscs,
  // });

  @override
  State<VariousDiscs> createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _makeDiscs();
              });
            },
            child: Text(
              'Click a disc',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _makeDiscs();
            });
          },
          child: Stack(
            children: [
              for (final disc in _discs)
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    alignment: disc.alignment,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: disc.color,
                        shape: BoxShape.circle,
                      ),
                      height: disc.size,
                      width: disc.size,
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
