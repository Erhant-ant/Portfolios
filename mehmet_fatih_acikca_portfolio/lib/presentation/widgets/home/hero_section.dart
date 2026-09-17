// lib/presentation/widgets/home/hero_section.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchWhatsApp() async {
    final url = Uri.parse("https://wa.me/${AppConstants.contactWhatsApp}");
    if (!await launchUrl(url)) debugPrint("WhatsApp açılamadı");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundOffWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? screenWidth * 0.1 : 24.0,
        vertical: 60.0,
      ),
      child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _buildTextContent(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: _buildHeroImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildHeroImage(),
        const SizedBox(height: 40),
        _buildTextContent(context, isMobile: true),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, {bool isMobile = false}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Her çocuğun kendi hızında öğrenme hakkı vardır.",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppTheme.textDarkGrey,
            height: 1.2,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 24),
        Text(
          "Bireyselleştirilmiş Eğitim Programları (BEP) ve aile iş birliği ile zihinsel özel eğitim ihtiyacı olan bireylerin akademik ve günlük yaşam becerilerini destekliyoruz.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[800],
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () => context.go('/iletisim'),
              icon: const Icon(Icons.calendar_month),
              label: const Text("Randevu / İletişim"),
            ),
            OutlinedButton.icon(
              onPressed: _launchWhatsApp,
              icon: const Icon(Icons.chat),
              label: const Text("WhatsApp'tan Yazın"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryGreen,
                side: const BorderSide(color: AppTheme.primaryGreen, width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroImage() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.15),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'assets/images/hero.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 400,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 400,
              child: const Center(
                child: Text(
                  "Resim Bekleniyor...\nLütfen 'assets/images/hero.jpg' dosyasına resmi kaydedin.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}