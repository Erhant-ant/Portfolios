// lib/presentation/widgets/home/educational_values_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';

class EducationalValuesSection extends StatelessWidget {
  const EducationalValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.primaryGreen.withOpacity(0.05),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? screenWidth * 0.1 : 24.0,
        vertical: 80.0,
      ),
      child: Column(
        children: [
          Text(
            "Eğitim Felsefemiz ve Temel Değerlerimiz",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ).animate().fade(duration: 600.ms).slideY(begin: 0.1),
          const SizedBox(height: 16),
          Text(
            "Uluslararası standartlarda, çocuk odaklı ve etik kurallara bağlı bir eğitim modeli benimsiyoruz.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ).animate(delay: 200.ms).fade(duration: 600.ms).slideY(begin: 0.1),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildValueItem(
                context,
                icon: Icons.science,
                title: "Kanıta Dayalı Uygulamalar",
                desc: "Sadece uluslararası alanda etkinliği bilimsel olarak kanıtlanmış (Evidence-Based Practice) özel eğitim yöntemlerini kullanıyoruz.",
              ).animate(delay: 300.ms).fade(duration: 500.ms).slideY(begin: 0.1),
              _buildValueItem(
                context,
                icon: Icons.diversity_3,
                title: "Nöroçeşitlilik Odaklı (Neurodiversity)",
                desc: "Otizm, disleksi veya zihinsel farklılıkları 'düzeltilmesi gereken hastalıklar' olarak değil, saygı duyulması gereken gelişimsel farklılıklar olarak görüyoruz.",
              ).animate(delay: 400.ms).fade(duration: 500.ms).slideY(begin: 0.1),
              _buildValueItem(
                context,
                icon: Icons.family_restroom,
                title: "Bütüncül ve Aile Merkezli",
                desc: "Eğitimin 45 dakikalık seanslarla sınırlı kalmaması gerektiğine inanıyor, aileyi sürecin en önemli takım arkadaşı (ko-terapist) olarak konumlandırıyoruz.",
              ).animate(delay: 500.ms).fade(duration: 500.ms).slideY(begin: 0.1),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValueItem(BuildContext context, {required IconData icon, required String title, required String desc}) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 56),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
