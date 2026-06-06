import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home_section_frame.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class HomeScanPromptCard extends StatefulWidget {
  const HomeScanPromptCard({super.key});

  @override
  State<HomeScanPromptCard> createState() => _HomeScanPromptCardState();
}

class _HomeScanPromptCardState extends State<HomeScanPromptCard> {
  // متغير لحفظ الصورة بعد التقاطها وعرضها في الـ UI
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // الدالة المسؤولة عن فتح الكاميرا والتقاط الصورة
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800, // لتحديد حجم الصورة وتقليل المساحة
        maxHeight: 1800,
        imageQuality: 85, // لضغط الصورة والحفاظ على الأداء
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path); // تحويل الـ XFile إلى File عادي
        });
      }
    } catch (e) {
      print("حدث خطأ أثناء فتح الكاميرا: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeSectionFrame(
      child: GestureDetector(
        onTap: pickImageFromCamera,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF9A1F), Color(0xFFFFB84D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.photo_camera_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      LocaleKeys.homeScanPromptTitle.tr(),
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF3E2200),
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        Text(
                          LocaleKeys.homeScanPromptMeta.tr(),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: const Color(0xFF5D3200),
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
