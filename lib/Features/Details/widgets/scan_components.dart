import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';

class ScanTopBar extends StatelessWidget {
  const ScanTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        DetailsTheme.spacingXs,
        DetailsTheme.spacingSm,
        DetailsTheme.spacingXs,
        DetailsTheme.spacingSm,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DetailsTheme.cardOutline.withValues(alpha: 0.4),
          ),
        ),
      ),
      child: Row(
        children: [
          const _TopBarIconBubble(
            icon: Icons.notifications_none_rounded,
            iconColor: DetailsTheme.primaryGreen,
          ),
          const SizedBox(width: DetailsTheme.spacingMd),
          const Expanded(
            child: Text(
              'CitrusGuard AI',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ScanTextStyles.appTitle,
            ),
          ),
          const SizedBox(width: DetailsTheme.spacingMd),
          const _ScanAvatar(),
        ],
      ),
    );
  }
}

class ScanPreviewSection extends StatelessWidget {
  final File imageFile;

  const ScanPreviewSection({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 257.25,
      decoration: BoxDecoration(
        color: const Color(0xFF141816),
        borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
        boxShadow: DetailsTheme.cardShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(imageFile, fit: BoxFit.cover),
            // const _PreviewBackdrop(),
            // const _ScanFrameArtwork(),
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: DetailsTheme.warning.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(DetailsTheme.radiusPill),
                ),
                child: const Text(
                  'تم اكتشاف المنطقة المصابة',
                  style: ScanTextStyles.badge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanStatsCard extends StatelessWidget {
  const ScanStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DetailsTheme.spacingXl),
      decoration: BoxDecoration(
        color: DetailsTheme.card,
        borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
        border: Border.all(color: DetailsTheme.cardOutline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ConfidenceRing(),
              SizedBox(width: 14),
              Expanded(child: _ScanSummary()),
            ],
          ),
          const SizedBox(height: DetailsTheme.spacingXl),
          Row(
            children: const [
              Expanded(
                child: _InfoTile(
                  label: 'تاريخ الفحص',
                  value: '24 مايو\n2024',
                  trailingIcon: Icons.calendar_today_outlined,
                ),
              ),
              SizedBox(width: DetailsTheme.spacingMd),
              Expanded(
                child: _InfoTile(
                  label: 'مستوى الخطورة',
                  value: 'متوسط',
                  valueColor: DetailsTheme.warningLight,
                  trailingIcon: Icons.warning_amber_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScanTreatmentCard extends StatelessWidget {
  const ScanTreatmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'خطة العلاج المقترحة',
                  textAlign: TextAlign.right,
                  style: ScanTextStyles.sectionTitle,
                ),
              ),
            ),
            SizedBox(width: DetailsTheme.spacingSm),
            Icon(
              Icons.medical_services_rounded,
              color: DetailsTheme.primaryGreen,
              size: 22,
            ),
          ],
        ),
        const SizedBox(height: DetailsTheme.spacingMd),
        Container(
          padding: const EdgeInsets.all(DetailsTheme.spacingXl),
          decoration: BoxDecoration(
            color: DetailsTheme.card,
            borderRadius: BorderRadius.circular(DetailsTheme.radiusLg),
            border: Border.all(color: DetailsTheme.cardOutline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'المبيد الموصى به',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.45,
                  color: DetailsTheme.warningLight,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'إيميداكلوبريد (Imidacloprid)',
                textAlign: TextAlign.right,
                style: ScanTextStyles.body,
              ),
              const SizedBox(height: DetailsTheme.spacingXl),
              Row(
                children: const [
                  Expanded(
                    child: _TreatmentMetric(
                      label: 'الجرعة',
                      value: '0.5 مل / لتر',
                    ),
                  ),
                  SizedBox(width: DetailsTheme.spacing2xl),
                  Expanded(
                    child: _TreatmentMetric(
                      label: 'التكرار',
                      value: 'كل 14 يوم',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DetailsTheme.spacingLg),
              Container(height: 1, color: DetailsTheme.cardOutline),
              const SizedBox(height: DetailsTheme.spacingLg),
              const Text(
                'قم برش الأوراق المصابة في الصباح الباكر أو قبل الغروب لثبات أفضل للمنتج. تأكد من تغطية الجزء السفلي.',
                textAlign: TextAlign.right,
                style: ScanTextStyles.bodyMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScanPreventionTipsCard extends StatelessWidget {
  const ScanPreventionTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'نصائح الوقاية',
                  textAlign: TextAlign.right,
                  style: ScanTextStyles.sectionTitle,
                ),
              ),
            ),
            SizedBox(width: DetailsTheme.spacingSm),
            Icon(
              Icons.shield_rounded,
              color: DetailsTheme.primaryGreen,
              size: 20,
            ),
          ],
        ),
        const SizedBox(height: DetailsTheme.spacingMd),
        const _TipTile(text: 'استخدم شتلات موثوقة وخالية من الأمراض.'),
        const SizedBox(height: DetailsTheme.spacingSm),
        const _TipTile(text: 'مراقبة دورية لنشاط حشرة سياس الحمضيات.'),
      ],
    );
  }
}

class ScanPrimaryActionButton extends StatelessWidget {
  const ScanPrimaryActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DetailsTheme.mintBackground,
          borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
          boxShadow: DetailsTheme.buttonShadow,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
          child: InkWell(
            borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
            onTap: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('حفظ السجل الزراعي', style: ScanTextStyles.button),
                SizedBox(width: DetailsTheme.spacingSm),
                Icon(
                  Icons.save_outlined,
                  color: DetailsTheme.mintText,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PreviewBackdrop extends StatelessWidget {
  const _PreviewBackdrop();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF111412).withValues(alpha: 0.2),
            const Color(0xFF122014),
            const Color(0xFF191A11),
            const Color(0xFF7A5018).withValues(alpha: 0.36),
          ],
          stops: const [0, 0.45, 0.8, 1],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -16,
            top: -10,
            child: Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [DetailsTheme.previewGlowStrong, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: -14,
            top: -20,
            child: Container(
              width: 156,
              height: 156,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0x66FFB84D), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00111412), Color(0x66111412)],
                  stops: [0.55, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanFrameArtwork extends StatelessWidget {
  const _ScanFrameArtwork();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 28,
              child: Transform.rotate(
                angle: -0.18,
                child: Icon(
                  Icons.eco_rounded,
                  size: 132,
                  color: const Color(0xFFE6D15D).withValues(alpha: 0.95),
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              right: 44,
              child: Transform.rotate(
                angle: 0.12,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        DetailsTheme.dangerGlow,
                        DetailsTheme.dangerGlow.withValues(alpha: 0.08),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 152,
                      height: 152,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DetailsTheme.radiusMd,
                        ),
                        border: Border.all(
                          color: DetailsTheme.warning.withValues(alpha: 0.4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: DetailsTheme.warning.withValues(alpha: 0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 126,
                      height: 126,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DetailsTheme.radiusMd,
                        ),
                        border: Border.all(
                          color: DetailsTheme.warning.withValues(alpha: 0.9),
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: DetailsTheme.warning.withValues(alpha: 0.48),
                            blurRadius: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfidenceRing extends StatelessWidget {
  const _ConfidenceRing();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: DetailsTheme.warning, width: 3),
          ),
          child: const Center(
            child: Text('94%', style: ScanTextStyles.statsNumber),
          ),
        ),
        const SizedBox(height: 8),
        const Text('نسبة الثقة', style: ScanTextStyles.caption),
      ],
    );
  }
}

class _ScanSummary extends StatelessWidget {
  const _ScanSummary();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text(
          'HLB - اضرار الحمضيات',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1.25,
            color: DetailsTheme.primaryGreen,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'AI Engine v4.2',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.45,
            color: DetailsTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.label,
    required this.value,
    required this.trailingIcon,
    this.valueColor = DetailsTheme.textPrimary,
  });

  final String label;
  final String value;
  final IconData trailingIcon;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      padding: const EdgeInsets.all(DetailsTheme.spacingMd),
      decoration: BoxDecoration(
        color: DetailsTheme.cardSoft,
        borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.right,
                  style: ScanTextStyles.caption,
                ),
                Text(
                  value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: DetailsTheme.spacingSm),
          Icon(trailingIcon, color: valueColor, size: 20),
        ],
      ),
    );
  }
}

class _TreatmentMetric extends StatelessWidget {
  const _TreatmentMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, textAlign: TextAlign.right, style: ScanTextStyles.caption),
        const SizedBox(height: 2),
        Text(value, textAlign: TextAlign.right, style: ScanTextStyles.body),
      ],
    );
  }
}

class _TipTile extends StatelessWidget {
  const _TipTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: DetailsTheme.spacingMd,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: DetailsTheme.card,
        borderRadius: BorderRadius.circular(DetailsTheme.radiusMd),
        border: Border.all(color: DetailsTheme.cardOutline),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: ScanTextStyles.body,
            ),
          ),
          const SizedBox(width: DetailsTheme.spacingMd),
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: DetailsTheme.primaryGreen,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBarIconBubble extends StatelessWidget {
  const _TopBarIconBubble({required this.icon, required this.iconColor});

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF17221D),
        shape: BoxShape.circle,
        border: Border.all(
          color: DetailsTheme.cardOutline.withValues(alpha: 0.9),
        ),
      ),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }
}

class _ScanAvatar extends StatelessWidget {
  const _ScanAvatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: const Color(0xFF1C3E32),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: DetailsTheme.primaryGreenDark,
        child: Icon(
          Icons.person_rounded,
          color: Colors.white.withValues(alpha: 0.96),
          size: 18,
        ),
      ),
    );
  }
}
