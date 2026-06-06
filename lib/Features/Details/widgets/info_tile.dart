import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    required this.trailingIcon,
    this.valueColor = DetailsTheme.textPrimary,
  });

  final String label;
  final String value;
  final IconData trailingIcon;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      padding: const EdgeInsets.all(DetailsTheme.spacingMd),
      decoration: BoxDecoration(
        color: DetailsTheme.cardSoft,
        borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.start,
                  style: ScanTextStyles.caption,
                ),
                Text(
                  value,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: DetailsTheme.spacingSm),
          Icon(trailingIcon, color: valueColor, size: 20),
        ],
      ),
    );
  }
}
