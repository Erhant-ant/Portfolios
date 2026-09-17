// lib/presentation/pages/services_page.dart
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final padding = isDesktop ? screenWidth * 0.1 : 24.0;

    final services = [
      {
        "icon": Icons.edit_document,
        "title": "BEP Hazırlama ve Bireysel Eğitim",
        "desc": "Öğrencinin eğitsel değerlendirme sonucuna göre, güçlü ve desteklenmesi gereken yönleri baz alınarak tamamen ona özel Bireyselleştirilmiş Eğitim Programı (BEP) hazırlanması ve uygulanması."
      },
      {
        "icon": Icons.child_care,
        "title": "Okul Öncesi ve İlköğretim Desteği",
        "desc": "Zihinsel özel eğitim ihtiyacı olan çocukların ilkokuma yazma, temel matematik ve okul öncesi kavram becerilerinin yapılandırılmış özel eğitim yöntemleriyle desteklenmesi."
      },
      {
        "icon": Icons.groups,
        "title": "Kaynaştırma Destek Eğitimi",
        "desc": "Örgün eğitim kurumlarında kaynaştırma/bütünleştirme öğrencisi olan çocukların, sınıf içi uyumlarını sağlamak ve akademik derslerini desteklemek amacıyla verilen eğitim."
      },
      {
        "icon": Icons.diversity_1,
        "title": "Aile Eğitimi ve Danışmanlık",
        "desc": "Öğrencinin okul veya kurumda öğrendiği becerileri eve taşıyabilmesi için ailelere verilen eğitimsel rehberlik. Ailenin eğitim sürecinde etkin rol almasının sağlanması."
      },
      {
        "icon": Icons.accessibility_new,
        "title": "Öz Bakım ve Günlük Yaşam Becerileri",
        "desc": "Bireyin bağımsız yaşamını sürdürebilmesi için gereken kişisel bakım, giyinme, beslenme ve toplumsal kurallara uyum becerilerinin aşamalı olarak öğretilmesi."
      },
      {
        "icon": Icons.menu_book,
        "title": "Hazırlık Sınıfı Desteği",
        "desc": "Özel eğitime ihtiyaç duyan öğrencilerin örgün eğitime veya özel eğitim okullarına hazırlık süreçlerinde ihtiyaç duydukları akademik ve bilişsel alt yapının oluşturulması."
      },
    ];

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundOffWhite,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Çalışma Alanları ve Eğitim Hizmetleri",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              "Tüm eğitim hizmetlerimiz, MEB Özel Eğitim Hizmetleri Yönetmeliği çerçevesinde ve bilimsel dayanaklı uygulamalar ışığında gerçekleştirilmektedir.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: services.asMap().entries.map((entry) {
              final index = entry.key;
              final s = entry.value;
              return _buildServiceCard(
                context, 
                icon: s["icon"] as IconData, 
                title: s["title"] as String, 
                description: s["desc"] as String,
              ).animate(delay: (100 * index).ms).fade(duration: 500.ms).slideY(begin: 0.1, curve: Curves.easeOut);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 40),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}