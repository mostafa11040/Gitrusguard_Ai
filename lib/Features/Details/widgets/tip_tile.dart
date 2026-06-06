import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class TipTile extends StatelessWidget {
  const TipTile({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: DetailsTheme.spacingMd,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: DetailsTheme.card,
        borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
        border: Border.all(color: DetailsTheme.cardOutline),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: DetailsTheme.primaryGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: DetailsTheme.spacingMd),
          Text(text, textAlign: TextAlign.right, style: ScanTextStyles.body),
        ],
      ),
    );
  }
}
