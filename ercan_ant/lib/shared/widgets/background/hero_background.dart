import 'package:flutter/material.dart';

class HeroBackground extends StatelessWidget {
  const HeroBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffFCFBF8), Color(0xffffffff), Color(0xffF7F3EC)],
        ),
      ),
      child: child,
    );
  }
}
