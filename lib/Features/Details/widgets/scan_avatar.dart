import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ScanAvatar extends StatelessWidget {
  const ScanAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: const Color(0xFF1C3E32),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: DetailsTheme.primaryGreenDark,
        child: Icon(
          Icons.person_rounded,
          color: Colors.white.withValues(alpha: 0.96),
          size: 18,
        ),
      ),
    );
  }
}
