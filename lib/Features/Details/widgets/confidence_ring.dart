import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ConfidenceRing extends StatelessWidget {
  const ConfidenceRing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: DetailsTheme.warning, width: 3),
          ),
          child: const Center(
            child: Text('94%', style: ScanTextStyles.statsNumber),
          ),
        ),
        const SizedBox(height: 8),
        const Text('نسبة الثقة', style: ScanTextStyles.caption),
      ],
    );
  }
}
