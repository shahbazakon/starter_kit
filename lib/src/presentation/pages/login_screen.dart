import 'package:flutter/material.dart';
import 'package:starter_kit/starter_kit.dart';

/// LoginScreen screen widget
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreen'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to LoginScreen', style: AppTextStyles.h1),
            const SizedBox(height: 16),
            Text(
              'This is a generated screen. Start building your UI here!',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Get Started',
              onPressed: _handleGetStarted,
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  void _handleGetStarted() {
    NavigationUtils.showSnackBar(message: 'Button pressed in LoginScreen!');
  }
}
