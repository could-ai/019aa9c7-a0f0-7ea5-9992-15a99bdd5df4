import 'package:flutter/material.dart';
import 'package:lgu_citizen_connect/core/theme/app_theme.dart';
import 'package:lgu_citizen_connect/features/auth/login_screen.dart';
import 'package:lgu_citizen_connect/features/citizen/home/citizen_home_screen.dart';

void main() {
  runApp(const LguCitizenConnectApp());
}

class LguCitizenConnectApp extends StatelessWidget {
  const LguCitizenConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LGU Citizen Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/citizen_home': (context) => const CitizenHomeScreen(),
      },
    );
  }
}
