import 'package:flutter/material.dart';

class FlowerLoader extends StatefulWidget {
  const FlowerLoader({super.key});

  @override
  State<FlowerLoader> createState() => _FlowerLoaderState();
}

class _FlowerLoaderState extends State<FlowerLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.rotate(angle: controller.value * 6.28, child: child);
      },
      child: SizedBox(
        width: 120,
        height: 120,
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(5, (index) {
            final angle = index * 72.0;
            return Transform.rotate(
              angle: angle * 3.1416 / 180,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 38,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFF9A8B), Color(0xFFB31200)],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
