import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/Features/Common/feature_placeholder_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class GisMapScreen extends StatelessWidget {
  const GisMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      titleKey: LocaleKeys.gisMapTitle,
      subtitleKey: LocaleKeys.gisMapSubtitle,
      icon: Icons.map_rounded,
      accentColor: Color(0xFFBFE3C5),
    );
  }
}
