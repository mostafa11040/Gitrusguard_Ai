import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.homeGreeting.tr(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.homeUserName.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 6),
                const Text('👋', style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
        const Spacer(),
        _IconBubble(
          icon: Icons.notifications_none_rounded,
          iconColor: const Color(0xFF9EDFD2),
          backgroundColor: const Color(0xFF17221D),
          borderColor: const Color(0xFF1E352F),
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFF1C3E32),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xFF2F6D57),
            child: Icon(
              Icons.person_rounded,
              color: Colors.white.withValues(alpha: 0.96),
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class _IconBubble extends StatelessWidget {
  const _IconBubble({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }
}
