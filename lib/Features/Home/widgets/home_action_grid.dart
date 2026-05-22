import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_feature_card.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class HomeActionGrid extends StatelessWidget {
  const HomeActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0,
        children: [
          HomeFeatureCard(
            title: context.tr(LocaleKeys.homeDiseasePredictionTitle),
            subtitle: context.tr(LocaleKeys.homeDiseasePredictionSubtitle),
            icon: Icons.auto_awesome_rounded,
            accentColor: Color(0xFF8A8A8A),
          ),
          HomeFeatureCard(
            title: context.tr(LocaleKeys.homeDiseaseMapTitle),
            subtitle: context.tr(LocaleKeys.homeDiseaseMapSubtitle),
            icon: Icons.map_outlined,
            accentColor: Color(0xFF6EE0A8),
          ),
          HomeFeatureCard(
            title: context.tr(LocaleKeys.homeScanLogTitle),
            subtitle: context.tr(LocaleKeys.homeScanLogSubtitle),
            icon: Icons.history_rounded,
            accentColor: Color(0xFF8D8D8D),
          ),
          HomeFeatureCard(
            title: context.tr(LocaleKeys.homeExportTitle),
            subtitle: context.tr(LocaleKeys.homeExportSubtitle),
            icon: Icons.verified_outlined,
            accentColor: Color(0xFFDE9A3A),
          ),
        ],
      ),
    );
  }
}
