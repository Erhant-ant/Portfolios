// lib/presentation/layout/main_layout.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/footer.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  // URL Launcher ile WhatsApp açma fonksiyonu
  Future<void> _launchWhatsApp() async {
    final url = Uri.parse("https://wa.me/${AppConstants.contactWhatsApp}");
    if (!await launchUrl(url)) {
      debugPrint("WhatsApp açılamadı: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: isDesktop ? null : const CustomDrawer(),
      // Yüzen WhatsApp Butonu (Sabit CTA)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _launchWhatsApp,
        backgroundColor: const Color(0xFF25D366), // Standart WhatsApp Yeşili
        icon: const Icon(Icons.chat, color: Colors.white),
        label: const Text("WhatsApp'tan Yazın", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Sayfa içeriği üstte yer alır (eğer sayfa kısaysa spaceBetween sayesinde footer alta itilir)
                  child,
                  // Yasal uyarıları içeren altbilgi hep en altta kalır
                  const Footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}