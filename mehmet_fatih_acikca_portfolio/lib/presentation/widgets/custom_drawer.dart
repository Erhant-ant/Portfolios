// lib/presentation/widgets/custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = {
      'Ana Sayfa': '/',
      'Hakkımda': '/hakkimda',
      'Çalışma Alanları': '/hizmetler',
      'Videolar': '/videolar',
      'Yorumlar & SSS': '/yorumlar',
      'İletişim / Randevu': '/iletisim',
    };

    return Drawer(
      backgroundColor: AppTheme.backgroundOffWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.primaryGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppConstants.teacherName,
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  AppConstants.teacherTitle,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ...menuItems.entries.map((entry) => ListTile(
            title: Text(
              entry.key, 
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.textDarkGrey)
            ),
            onTap: () {
              Navigator.pop(context); 
              context.go(entry.value);
            },
          )),
        ],
      ),
    );
  }
}