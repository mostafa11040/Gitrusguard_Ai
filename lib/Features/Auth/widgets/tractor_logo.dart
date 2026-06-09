import 'package:flutter/material.dart';

class TractorLogo extends StatelessWidget {
  const TractorLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0x1A18A57E),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF18A57E).withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF18A57E).withValues(alpha: 0.05),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.agriculture_rounded,
          color: Color(0xFF95D4B3),
          size: 38,
        ),
      ),
    );
  }
}
