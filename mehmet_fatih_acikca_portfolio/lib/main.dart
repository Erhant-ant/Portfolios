// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart'; // Yeni eklenen router

void main() {
  usePathUrlStrategy();
  runApp(const SpecialEducationPortfolioApp());
}

class SpecialEducationPortfolioApp extends StatelessWidget {
  const SpecialEducationPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, 
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router, // Router bağlandı
    );
  }
}