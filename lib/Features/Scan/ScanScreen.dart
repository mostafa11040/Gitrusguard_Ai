import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gitrusguard_ai/Features/Common/feature_placeholder_screen.dart';
import 'package:gitrusguard_ai/Features/Details/details_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';
import 'package:image_picker/image_picker.dart';

class Scanscreen extends StatefulWidget {
  const Scanscreen({super.key});

  @override
  State<Scanscreen> createState() => _ScanscreenState();
}

class _ScanscreenState extends State<Scanscreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });

        // الانتقال إلى صفحة التفاصيل وتمرير الصورة لها فوراً بعد الالتقاط
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(imageFile: _imageFile!),
            ),
          );
        }
      }
    } catch (e) {
      print("حدث خطأ أثناء فتح الكاميرا: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // تم حذف المتغيرات المكررة من هنا لضمان عمل الـ setState بشكل سليم
    return GestureDetector(
      onTap: pickImageFromCamera,
      child: const FeaturePlaceholderScreen(
        titleKey: LocaleKeys.scanTitle,
        subtitleKey: LocaleKeys.scanSubtitle,
        icon: Icons.qr_code_scanner,
        accentColor: Color(0xFFFFB84D),
      ),
    );
  }
}
