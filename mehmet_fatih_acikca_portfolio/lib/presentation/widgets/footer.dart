// lib/presentation/widgets/footer.dart
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.textDarkGrey,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Sadece içeriği kadar yer kaplasın
        children: [
          Text(
            "${AppConstants.teacherName} - ${AppConstants.teacherTitle}",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          
          // Yasal ve KVKK Uyarılarını sıkıştırdık
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                Text(
                  AppConstants.legalDisclaimer,
                  style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  AppConstants.kvkkDisclaimer,
                  style: const TextStyle(color: Colors.white54, fontSize: 10, height: 1.3),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Sosyal Medya İkonları
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.camera_alt_outlined, AppConstants.linkInstagram),
              const SizedBox(width: 12),
              _buildSocialIcon(Icons.facebook, AppConstants.linkFacebook),
              const SizedBox(width: 12),
              _buildSocialIcon(Icons.video_library, AppConstants.linkYoutube),
              const SizedBox(width: 12),
              _buildSocialIcon(Icons.work_outline, AppConstants.linkLinkedIn),
            ],
          ),
          
          const SizedBox(height: 12),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 12),
          Text(
            "© ${DateTime.now().year} Tüm hakları saklıdır.",
            style: const TextStyle(color: Colors.white54, fontSize: 11),
          ),
          const SizedBox(height: 6),
          // Geliştirici (Tasarımcı) İmzanız
          InkWell(
            onTap: () => _launchURL("https://erhant-ant.github.io/erhan_ant_portfolio/"),
            child: const Text(
              "Designed & Developed by Erhan Ant",
              style: TextStyle(
                color: AppTheme.primaryGreen, // İnce bir yeşil vurgu
                fontSize: 11,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline, // Tıklanabilir olduğu anlaşılsın diye
                decorationColor: AppTheme.primaryGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}