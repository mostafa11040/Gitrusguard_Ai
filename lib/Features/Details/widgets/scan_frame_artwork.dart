import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ScanFrameArtwork extends StatelessWidget {
  const ScanFrameArtwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 28,
              child: Transform.rotate(
                angle: -0.18,
                child: Icon(
                  Icons.eco_rounded,
                  size: 132,
                  color: const Color(0xFFE6D15D).withValues(alpha: 0.95),
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              right: 44,
              child: Transform.rotate(
                angle: 0.12,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        DetailsTheme.dangerGlow,
                        DetailsTheme.dangerGlow.withValues(alpha: 0.08),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 152,
                      height: 152,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DetailsTheme.radiusMd,
                        ),
                        border: Border.all(
                          color: DetailsTheme.warning.withValues(alpha: 0.4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: DetailsTheme.warning.withValues(alpha: 0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 126,
                      height: 126,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DetailsTheme.radiusMd,
                        ),
                        border: Border.all(
                          color: DetailsTheme.warning.withValues(alpha: 0.9),
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: DetailsTheme.warning.withValues(alpha: 0.48),
                            blurRadius: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
