// lib/presentation/widgets/home/expertise_section.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? screenWidth * 0.1 : 24.0,
        vertical: 80.0,
      ),
      child: Column(
        children: [
          Text(
            "Çalışma ve Destek Alanlarımız",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Öğrencilerimizin ihtiyaçlarına yönelik bilimsel dayanaklı eğitim programları uyguluyoruz.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildExpertiseCard(
                context,
                icon: Icons.assignment,
                title: "BEP Hazırlama ve Uygulama",
                description: "Öğrencinin mevcut performansına uygun, ulaşılabilir hedefler barındıran Bireyselleştirilmiş Eğitim Programı geliştirilmesi.",
              ),
              _buildExpertiseCard(
                context,
                icon: Icons.family_restroom,
                title: "Aile Eğitimi ve İş Birliği",
                description: "Öğrenilen becerilerin ev ortamına genellenebilmesi için ailelere yönelik eğitimsel rehberlik ve destek.",
              ),
              _buildExpertiseCard(
                context,
                icon: Icons.school,
                title: "Kaynaştırma Eğitimi Desteği",
                description: "Örgün eğitime devam eden öğrencilerin sınıf içi uyumlarını ve akademik süreçlerini destekleyici özel eğitim çalışmaları.",
              ),
              _buildExpertiseCard(
                context,
                icon: Icons.accessibility_new,
                title: "Günlük Yaşam Becerileri",
                description: "Öz bakım, bağımsız yaşam ve toplumsal kurallara uyum becerilerinin sistematik öğretimi.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseCard(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.backgroundOffWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.primaryGreen, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}