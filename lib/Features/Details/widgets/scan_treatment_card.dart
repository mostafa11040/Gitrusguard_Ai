import 'package:flutter/material.dart';

import '../constants/scan_theme.dart';
import 'treatment_metric.dart';

class ScanTreatmentCard extends StatelessWidget {
  const ScanTreatmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Icon(
              Icons.medical_services_rounded,
              color: DetailsTheme.primaryGreen,
              size: 22,
            ),
            SizedBox(width: DetailsTheme.spacingSm),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'خطة العلاج المقترحة',
                textAlign: TextAlign.right,
                style: ScanTextStyles.sectionTitle,
              ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                children: [
                  TreatmentMetric(label: 'الجرعة', value: '0.5 مل / لتر'),
                  SizedBox(width: DetailsTheme.spacing2xl),
                  TreatmentMetric(label: 'التكرار', value: 'كل 14 يوم'),
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
