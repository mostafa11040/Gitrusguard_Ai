import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class PreviewBackdrop extends StatelessWidget {
  const PreviewBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF111412).withValues(alpha: 0.2),
            const Color(0xFF122014),
            const Color(0xFF191A11),
            const Color(0xFF7A5018).withValues(alpha: 0.36),
          ],
          stops: const [0, 0.45, 0.8, 1],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -16,
            top: -10,
            child: Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [DetailsTheme.previewGlowStrong, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: -14,
            top: -20,
            child: Container(
              width: 156,
              height: 156,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0x66FFB84D), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00111412), Color(0x66111412)],
                  stops: [0.55, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
