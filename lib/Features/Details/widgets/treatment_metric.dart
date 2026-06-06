import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class TreatmentMetric extends StatelessWidget {
  const TreatmentMetric({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, textAlign: TextAlign.right, style: ScanTextStyles.caption),
        const SizedBox(height: 2),
        Text(value, textAlign: TextAlign.right, style: ScanTextStyles.body),
      ],
    );
  }
}
