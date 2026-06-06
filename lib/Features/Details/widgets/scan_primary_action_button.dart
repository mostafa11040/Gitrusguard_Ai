import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ScanPrimaryActionButton extends StatelessWidget {
  const ScanPrimaryActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DetailsTheme.mintBackground,
          borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
          boxShadow: DetailsTheme.buttonShadow,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
          child: InkWell(
            borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
            onTap: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('حفظ السجل الزراعي', style: ScanTextStyles.button),
                SizedBox(width: DetailsTheme.spacingSm),
                Icon(
                  Icons.save_outlined,
                  color: DetailsTheme.mintText,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
