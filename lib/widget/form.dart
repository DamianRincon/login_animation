import 'package:flutter/material.dart';

class FormExample extends StatelessWidget {
  const FormExample({super.key, required this.panelOpacity});
  final double panelOpacity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: panelOpacity,
        //opacity: secondPanelAnimation.value,
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {},
                style: .new(minimumSize: .all(Size(200, 50))),
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
