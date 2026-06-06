import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ScanSummary extends StatelessWidget {
  const ScanSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'HLB - اضرار الحمضيات',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1.25,
            color: DetailsTheme.primaryGreen,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'AI Engine v4.2',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.45,
            color: DetailsTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}
