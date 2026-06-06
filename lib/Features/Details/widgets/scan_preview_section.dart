import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ScanPreviewSection extends StatelessWidget {
  final File imageFile;

  const ScanPreviewSection({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 257.25,
      decoration: BoxDecoration(
        color: const Color(0xFF141816),
        borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
        boxShadow: DetailsTheme.cardShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(imageFile, fit: BoxFit.cover),
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: DetailsTheme.warning.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(DetailsTheme.radiusPill),
                ),
                child: const Text(
                  'تم اكتشاف المنطقة المصابة',
                  style: ScanTextStyles.badge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
