import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class TopBarIconBubble extends StatelessWidget {
  const TopBarIconBubble({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF17221D),
        shape: BoxShape.circle,
        border: Border.all(
          color: DetailsTheme.cardOutline.withValues(alpha: 0.9),
        ),
      ),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }
}
