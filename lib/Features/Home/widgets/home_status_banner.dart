import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_section_frame.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class HomeStatusBanner extends StatelessWidget {
  const HomeStatusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSectionFrame(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF421617), Color(0xFF5C1918)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF7D3131), width: 1.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFB50E21),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.homeStatusAlertTitle.tr(),
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFFFFC9C9),
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  LocaleKeys.homeStatusAlertSubtitle.tr(),
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFFF6D7D7).withValues(alpha: 0.92),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
