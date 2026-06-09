import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/Features/Auth/login_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';
import 'package:gitrusguard_ai/core/localization/localization_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    final isArabic = LocalizationHelper.isArabic(currentLocale);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  LocaleKeys.settingsTitle.tr(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  LocaleKeys.settingsSubtitle.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 20),
                _LanguageSection(isArabic: isArabic),
                const SizedBox(height: 18),
                const _InfoCard(),
                const SizedBox(height: 22),
                _SettingsTile(
                  title: LocaleKeys.settingsMyNotifications.tr(),
                  icon: Icons.notifications_none_rounded,
                  iconColor: const Color(0xFF95D4B3),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: LocaleKeys.settingsSavedTreatments.tr(),
                  icon: Icons.bookmark_border_rounded,
                  iconColor: const Color(0xFFFFB84D),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: LocaleKeys.settingsFollowedExperts.tr(),
                  icon: Icons.people_outline_rounded,
                  iconColor: const Color(0xFFBFC9C1),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: LocaleKeys.settingsLogout.tr(),
                  icon: Icons.logout_rounded,
                  iconColor: const Color(0xFFFFA4A4),
                  isDestructive: true,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageSection extends StatelessWidget {
  const _LanguageSection({required this.isArabic});

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF171A18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF22322B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.language_rounded, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.settingsLanguageSectionTitle.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      LocaleKeys.settingsLanguageDescription.tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white60,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _LanguageChoiceCard(
                  title: LocaleKeys.settingsArabic.tr(),
                  subtitle: LocaleKeys.settingsRtlLabel.tr(),
                  isSelected: isArabic,
                  accentColor: const Color(0xFF95D4B3),
                  onTap: () =>
                      LocalizationHelper.setLocale(context, const Locale('ar')),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _LanguageChoiceCard(
                  title: LocaleKeys.settingsEnglish.tr(),
                  subtitle: LocaleKeys.settingsLtrLabel.tr(),
                  isSelected: !isArabic,
                  accentColor: const Color(0xFF9EDFD2),
                  onTap: () =>
                      LocalizationHelper.setLocale(context, const Locale('en')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LanguageChoiceCard extends StatelessWidget {
  const _LanguageChoiceCard({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.accentColor,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.14)
              : const Color(0xFF202421),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? accentColor.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined,
                  color: isSelected ? accentColor : Colors.white54,
                  size: 18,
                ),
                const Spacer(),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF141714),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded, color: Color(0xFF9EDFD2)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              LocaleKeys.settingsAutoSaved.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.isDestructive = false,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == ui.TextDirection.rtl;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF171A18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 22,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isDestructive ? const Color(0xFFFFA4A4) : Colors.white,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  isRtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
                  color: isDestructive
                      ? const Color(0xFFFFA4A4).withValues(alpha: 0.6)
                      : Colors.white.withValues(alpha: 0.3),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
