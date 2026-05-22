import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_section_frame.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class HomeCoverageCard extends StatelessWidget {
  const HomeCoverageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSectionFrame(
      child: Container(
        height: 186,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF1A1F1B), Color(0xFF111412)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(child: _CoverageBackdrop()),
            PositionedDirectional(
              end: 18,
              bottom: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF121612).withValues(alpha: 0.88),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Text(
                  LocaleKeys.homeLiveFieldActivity.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              start: 14,
              bottom: 14,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFBFE3C5),
                  foregroundColor: const Color(0xFF113A2A),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  LocaleKeys.homeViewDetails.tr(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoverageBackdrop extends StatelessWidget {
  const _CoverageBackdrop();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CoverageBackdropPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _CoverageBackdropPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0E120F), Color(0xFF1D211D)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Offset.zero & size, basePaint);

    final glowPaint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              const Color(0xFF4C5B4E).withValues(alpha: 0.26),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.58, size.height * 0.42),
              radius: size.width * 0.52,
            ),
          );
    canvas.drawRect(Offset.zero & size, glowPaint);

    final hillPaint = Paint()
      ..color = const Color(0xFF2C302E).withValues(alpha: 0.95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    final path = Path()
      ..moveTo(size.width * 0.15, size.height * 0.82)
      ..cubicTo(
        size.width * 0.28,
        size.height * 0.58,
        size.width * 0.35,
        size.height * 0.42,
        size.width * 0.52,
        size.height * 0.46,
      )
      ..cubicTo(
        size.width * 0.67,
        size.height * 0.49,
        size.width * 0.71,
        size.height * 0.30,
        size.width * 0.92,
        size.height * 0.24,
      );

    canvas.drawPath(path, hillPaint);

    final contourPaint = Paint()
      ..color = const Color(0xFF59655B).withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (var index = 0; index < 4; index++) {
      final offset = 0.06 * index;
      final contour = Path()
        ..moveTo(size.width * (0.08 + offset), size.height * (0.78 - offset))
        ..cubicTo(
          size.width * (0.22 + offset),
          size.height * (0.58 - offset),
          size.width * (0.42 + offset),
          size.height * (0.42 - offset),
          size.width * (0.72 - offset),
          size.height * (0.34 - offset),
        );
      canvas.drawPath(contour, contourPaint);
    }

    final dotPaint = Paint()
      ..color = const Color(0xFF7B8E80).withValues(alpha: 0.26);
    for (final point in <Offset>[
      Offset(size.width * 0.25, size.height * 0.66),
      Offset(size.width * 0.44, size.height * 0.55),
      Offset(size.width * 0.63, size.height * 0.46),
      Offset(size.width * 0.78, size.height * 0.33),
    ]) {
      canvas.drawCircle(point, 2.2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
