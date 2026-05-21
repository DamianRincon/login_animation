import 'package:example_login/widget/custom_container.dart';
import 'package:example_login/widget/custom_loader.dart';
import 'package:example_login/widget/form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepOrangeAccent),
      ),
      home: const MyHomePage(title: 'Flutter Login Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> leftPanelAnimation;
  late Animation<double> rightPanelAnimation;
  late Animation<double> topPanelAnimation;
  late Animation<double> bottomPanelAnimation;
  late Animation<double> loaderOpacity;
  late Animation<double> loaderTopAnimation;
  late Animation<double> secondPanelAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    leftPanelAnimation = Tween<double>(begin: -200, end: -1000).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeOut),
      ),
    );
    rightPanelAnimation = Tween<double>(begin: -200, end: -1000).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeOut),
      ),
    );
    topPanelAnimation = Tween<double>(begin: -120, end: -1000).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeOut),
      ),
    );
    loaderOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.3, curve: Curves.easeInOut),
      ),
    );

    loaderTopAnimation = Tween<double>(begin: 200, end: 20).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeOut),
      ),
    );

    bottomPanelAnimation = Tween<double>(begin: 0, end: -250).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeInToLinear),
      ),
    );
    secondPanelAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, _) => Stack(
          fit: .expand,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              top: loaderTopAnimation.value,
              left: 0,
              right: 0,
              child: Container(
                width: 150,
                height: 150,
                alignment: .center,
                padding: .all(10),
                child: FlowerLoader(),
              ),
            ),
            FormExample(panelOpacity: secondPanelAnimation.value),
            containerBottom(bottomPanelAnimation.value),
            containerTop(topPanelAnimation.value),
            containerLeft(leftPanelAnimation.value),
            containerRight(rightPanelAnimation.value),
          ],
        ),
      ),
    );
  }
}
