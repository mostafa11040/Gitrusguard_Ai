import 'package:flutter/material.dart';

class DetailsTheme {
  static const Color background = Color(0xFF111412);
  static const Color card = Color(0xB01D201E);
  static const Color cardSoft = Color(0x4D323633);
  static const Color cardOutline = Color(0x4D404943);
  static const Color primaryGreen = Color(0xFF95D4B3);
  static const Color primaryGreenDark = Color(0xFF2D6A4F);
  static const Color mintBackground = Color(0xFFB2E4C9);
  static const Color mintText = Color(0xFF003824);
  static const Color textPrimary = Color(0xFFE1E3DF);
  static const Color textSecondary = Color(0xFFBFC9C1);
  static const Color warning = Color(0xFFFD8B00);
  static const Color warningLight = Color(0xFFFFB77D);
  static const Color warningDarkText = Color(0xFF603100);
  static const Color previewGlow = Color(0x1AFFB84D);
  static const Color previewGlowStrong = Color(0x66FFB84D);
  static const Color dangerGlow = Color(0x66FF6A4D);

  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusPill = 9999;

  static const double spacingXs = 4;
  static const double spacingSm = 8;
  static const double spacingMd = 12;
  static const double spacingLg = 16;
  static const double spacingXl = 20;
  static const double spacing2xl = 24;

  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 15,
      offset: Offset(0, 10),
      spreadRadius: -3,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 6,
      offset: Offset(0, 4),
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Color(0x3395D4B3),
      blurRadius: 15,
      offset: Offset(0, 10),
      spreadRadius: -3,
    ),
    BoxShadow(
      color: Color(0x3395D4B3),
      blurRadius: 6,
      offset: Offset(0, 4),
      spreadRadius: -4,
    ),
  ];
}

class ScanTextStyles {
  static const TextStyle appTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: DetailsTheme.primaryGreen,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: DetailsTheme.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: DetailsTheme.primaryGreen,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: DetailsTheme.textPrimary,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: DetailsTheme.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: DetailsTheme.textSecondary,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: DetailsTheme.warningDarkText,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: DetailsTheme.mintText,
  );

  static const TextStyle statsNumber = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: DetailsTheme.warningLight,
  );
}
