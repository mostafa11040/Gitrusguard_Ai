import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/Features/Common/feature_placeholder_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      titleKey: LocaleKeys.statsTitle,
      subtitleKey: LocaleKeys.statsSubtitle,
      icon: Icons.bar_chart_rounded,
      accentColor: Color(0xFF95D4B3),
    );
  }
}
