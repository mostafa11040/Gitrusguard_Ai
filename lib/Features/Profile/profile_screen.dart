import 'package:flutter/material.dart';

import 'package:gitrusguard_ai/Features/Common/feature_placeholder_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),

              Text(
                "مصطفي علي",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
