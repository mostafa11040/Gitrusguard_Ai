import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';
import 'confidence_ring.dart';
import 'scan_summary.dart';
import 'info_tile.dart';

class ScanStatsCard extends StatelessWidget {
  const ScanStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DetailsTheme.spacingXl),
      decoration: BoxDecoration(
        color: DetailsTheme.card,
        borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
        border: Border.all(color: DetailsTheme.cardOutline),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(child: ScanSummary()),
              SizedBox(width: 14),
              ConfidenceRing(),
            ],
          ),
          const SizedBox(height: DetailsTheme.spacingXl),
          Row(
            children: const [
              Expanded(
                child: InfoTile(
                  label: 'تاريخ الفحص',
                  value: '24 مايو 2024',
                  trailingIcon: Icons.calendar_today_outlined,
                ),
              ),
              SizedBox(width: DetailsTheme.spacingMd),
              Expanded(
                child: InfoTile(
                  label: 'مستوى الخطورة',
                  value: 'متوسط',
                  valueColor: DetailsTheme.warningLight,
                  trailingIcon: Icons.warning_amber_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
