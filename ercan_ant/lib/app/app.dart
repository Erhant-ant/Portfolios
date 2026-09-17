import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';

class ErcanAntApp extends StatelessWidget {
  const ErcanAntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Ercan Ant',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
