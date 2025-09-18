import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full-screen background
        SizedBox.expand(child: Image.asset('assets/backgrounds/ic_app_bg.webp', fit: BoxFit.cover)),
        // Your foreground content
        child,
      ],
    );
  }
}
