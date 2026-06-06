import 'package:flutter/material.dart';

import 'widgets/profile_recent_logs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
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
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 16),
                    SizedBox(width: 8),
                    Text("شقرف - طنطا", style: TextStyle(fontSize: 18)),
                  ],
                ),

                const SizedBox(height: 24),
                const ProfileRecentLogs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
