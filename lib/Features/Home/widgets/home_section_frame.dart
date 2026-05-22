import 'package:flutter/material.dart';

class HomeSectionFrame extends StatelessWidget {
  const HomeSectionFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF126D9A), width: 0.9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}
