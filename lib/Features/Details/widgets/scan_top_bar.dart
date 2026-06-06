import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

import 'topbar_icon_bubble.dart';
import 'scan_avatar.dart';

class ScanTopBar extends StatelessWidget {
  const ScanTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        DetailsTheme.spacingXs,
        DetailsTheme.spacingSm,
        DetailsTheme.spacingXs,
        DetailsTheme.spacingSm,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DetailsTheme.cardOutline.withValues(alpha: 0.4),
          ),
        ),
      ),
      child: Row(
        children: [
          const TopBarIconBubble(
            icon: Icons.notifications_none_rounded,
            iconColor: DetailsTheme.primaryGreen,
          ),
          const SizedBox(width: DetailsTheme.spacingMd),
          const Expanded(
            child: Text(
              'CitrusGuard AI',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ScanTextStyles.appTitle,
            ),
          ),
          const SizedBox(width: DetailsTheme.spacingMd),
          const ScanAvatar(),
        ],
      ),
    );
  }
}
