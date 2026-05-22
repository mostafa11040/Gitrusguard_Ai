import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/Features/Home/widgets/home_action_grid.dart';
import 'package:gitrusguard_ai/Features/Home/widgets/home_coverage_card.dart';
import 'package:gitrusguard_ai/Features/Home/widgets/home_scan_prompt_card.dart';
import 'package:gitrusguard_ai/Features/Home/widgets/home_status_banner.dart';
import 'package:gitrusguard_ai/Features/Home/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final horizontalPadding = screenWidth < 380 ? 14.0 : 16.0;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    12,
                    horizontalPadding,
                    112,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HomeTopBar(),
                      SizedBox(height: 24),
                      HomeStatusBanner(),
                      SizedBox(height: 22),
                      HomeScanPromptCard(),
                      SizedBox(height: 22),
                      HomeActionGrid(),
                      SizedBox(height: 22),
                      HomeCoverageCard(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
