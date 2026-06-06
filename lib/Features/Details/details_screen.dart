import 'dart:io';

import 'package:flutter/material.dart';

import 'constants/scan_theme.dart';
import 'widgets/scan_components.dart';

class DetailsScreen extends StatelessWidget {
  final File imageFile;

  const DetailsScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DetailsTheme.background,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxContentWidth = constraints.maxWidth < 420
                ? constraints.maxWidth
                : 420.0;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      constraints.maxWidth < 380 ? 14 : 16,
                      8,
                      constraints.maxWidth < 380 ? 14 : 16,
                      28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ScanTopBar(),
                        SizedBox(height: 18),
                        ScanPreviewSection(imageFile: imageFile),
                        SizedBox(height: 22),
                        ScanStatsCard(),
                        SizedBox(height: 22),
                        ScanTreatmentCard(),
                        SizedBox(height: 22),
                        ScanPreventionTipsCard(),
                        SizedBox(height: 22),
                        ScanPrimaryActionButton(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
