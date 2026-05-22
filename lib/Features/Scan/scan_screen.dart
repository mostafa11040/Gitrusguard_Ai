import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/Features/Common/feature_placeholder_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      titleKey: LocaleKeys.scanTitle,
      subtitleKey: LocaleKeys.scanSubtitle,
      icon: Icons.qr_code_scanner_rounded,
      accentColor: Color(0xFFFFB84D),
    );
  }
}
