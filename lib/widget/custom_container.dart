import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.rotate = 45 * math.pi / 180});
  final double size = 410;
  final double? rotate;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate!,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF9A7A), Color(0xFFB31200)],
          ),
        ),
      ),
    );
  }
}

Widget containerTop(double positioned) => AnimatedPositioned(
  top: positioned,
  left: 0,
  right: 0,
  duration: Duration(milliseconds: 800),
  child: CustomContainer(),
);

Widget containerLeft(double positioned) => AnimatedPositioned(
  left: positioned,
  top: 230,
  duration: Duration(milliseconds: 800),
  child: CustomContainer(),
);

Widget containerRight(double positioned) => AnimatedPositioned(
  right: positioned,
  top: 235,
  duration: Duration(milliseconds: 800),
  child: CustomContainer(rotate: -45 * math.pi / 180),
);

Widget containerBottom(double positioned) => AnimatedPositioned(
  bottom: -120 - (positioned * -0.7),
  left: positioned,
  right: 0,
  duration: Duration(milliseconds: 400),
  child: CustomContainer(),
);
