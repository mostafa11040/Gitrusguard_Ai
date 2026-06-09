import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gitrusguard_ai/Features/Auth/signup_screen.dart';
import 'package:gitrusguard_ai/Features/Auth/widgets/auth_button.dart';
import 'package:gitrusguard_ai/Features/Auth/widgets/auth_text_field.dart';
import 'package:gitrusguard_ai/Features/Auth/widgets/social_login_button.dart';
import 'package:gitrusguard_ai/Features/Auth/widgets/tractor_logo.dart';
import 'package:gitrusguard_ai/Features/bottom_nav_bar/bottom_navigationBar.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavigationBarShell(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 500 ? screenWidth * 0.92 : 440.0;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient matching the premium style
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F1A16), // Muted dark green-black at top
                  Color(0xFF0C100E), // Muted near-black
                  Color(0xFF070B09), // Black at bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          // Subtle glow highlight at the top
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            height: 300,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x1418A57E),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TractorLogo(),
                      const SizedBox(height: 20),
                      Text(
                        LocaleKeys.authSignInTitle.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          LocaleKeys.authSignInSubtitle.tr(),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 28),
                      
                      // Glassmorphic Card Container
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            width: cardWidth,
                            padding: const EdgeInsets.all(24.0),
                            decoration: BoxDecoration(
                              color: const Color(0x730F1412),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.04),
                                width: 1.2,
                              ),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AuthTextField(
                                    labelText: LocaleKeys.authEmail.tr(),
                                    hintText: LocaleKeys.authEmailHint.tr(),
                                    icon: Icons.mail_outline_rounded,
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val == null || val.isEmpty || !val.contains('@')) {
                                        return '';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 22),
                                  AuthTextField(
                                    labelText: LocaleKeys.authPassword.tr(),
                                    hintText: LocaleKeys.authPasswordHint.tr(),
                                    icon: Icons.lock_outline_rounded,
                                    controller: _passwordController,
                                    obscureText: true,
                                    validator: (val) {
                                      if (val == null || val.length < 6) {
                                        return '';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 32),
                                  AuthButton(
                                    text: LocaleKeys.authSignInBtn.tr(),
                                    isLoading: false,
                                    onPressed: _handleLogin,
                                  ),
                                  const SizedBox(height: 24),
                                  
                                  // Divider
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colors.white.withValues(alpha: 0.05),
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          LocaleKeys.authOrVia.tr(),
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.3),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.white.withValues(alpha: 0.05),
                                          thickness: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  // Social sign in buttons
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SocialLoginButton(
                                          text: LocaleKeys.authApple.tr(),
                                          isGoogle: false,
                                          onTap: () {},
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: SocialLoginButton(
                                          text: LocaleKeys.authGoogle.tr(),
                                          isGoogle: true,
                                          onTap: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      
                      // Bottom Switch Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.authNoAccount.tr(),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.4),
                              fontSize: 14.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "إنشاء حساب جديد", // localized logically
                              style: TextStyle(
                                color: Color(0xFFFF9E1B),
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
