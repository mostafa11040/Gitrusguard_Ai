import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';
import 'tip_tile.dart';

class ScanPreventionTipsCard extends StatelessWidget {
  const ScanPreventionTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Icon(
              Icons.shield_rounded,
              color: DetailsTheme.primaryGreen,
              size: 20,
            ),
            SizedBox(width: DetailsTheme.spacingSm),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'نصائح الوقاية',
                textAlign: TextAlign.right,
                style: ScanTextStyles.sectionTitle,
              ),
            ),
          ],
        ),
        const SizedBox(height: DetailsTheme.spacingMd),
        const TipTile(text: 'استخدم شتلات موثوقة وخالية من الأمراض.'),
        const SizedBox(height: DetailsTheme.spacingSm),
        const TipTile(text: 'مراقبة دورية لنشاط حشرة سياس الحمضيات.'),
      ],
    );
  }
}
