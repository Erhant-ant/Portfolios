// lib/presentation/widgets/home/process_roadmap_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';

class ProcessRoadmapSection extends StatelessWidget {
  const ProcessRoadmapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    final steps = [
      {
        "step": "1",
        "title": "Ön Görüşme ve Gözlem",
        "desc": "Aile ile tanışma, beklentilerin dinlenmesi ve öğrencinin doğal ortamında/oyun sırasında eğitsel gözleminin yapılması."
      },
      {
        "step": "2",
        "title": "Eğitsel Değerlendirme",
        "desc": "Öğrencinin güçlü yanlarının ve desteklenmesi gereken akademik/gelişimsel ihtiyaçlarının bilimsel yöntemlerle belirlenmesi."
      },
      {
        "step": "3",
        "title": "BEP ve Hedef Belirleme",
        "desc": "Öğrenciye tamamen özgü, ölçülebilir ve ulaşılabilir hedefleri içeren Bireyselleştirilmiş Eğitim Programı'nın (BEP) hazırlanması."
      },
      {
        "step": "4",
        "title": "Uygulama ve Aile İş Birliği",
        "desc": "Eğitim sürecinin başlaması, düzenli ilerleme takibi ve öğrenilenlerin eve genellenmesi için aileye danışmanlık verilmesi."
      },
    ];

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
            "Süreç Nasıl İşliyor?",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ).animate().fade(duration: 600.ms).slideY(begin: 0.1),
          const SizedBox(height: 16),
          Text(
            "Başarıya giden yol, planlı ve şeffaf bir iş birliğinden geçer.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ).animate(delay: 200.ms).fade(duration: 600.ms).slideY(begin: 0.1),
          const SizedBox(height: 60),
          
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: steps.asMap().entries.map((entry) {
                    return Expanded(
                      child: _buildStepCard(context, entry.value, isDesktop)
                          .animate(delay: (200 + (100 * entry.key)).ms)
                          .fade(duration: 500.ms)
                          .slideX(begin: 0.1),
                    );
                  }).toList(),
                )
              : Column(
                  children: steps.asMap().entries.map((entry) {
                    return _buildStepCard(context, entry.value, isDesktop)
                        .animate(delay: (200 + (100 * entry.key)).ms)
                        .fade(duration: 500.ms)
                        .slideY(begin: 0.1);
                  }).toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildStepCard(BuildContext context, Map<String, String> stepInfo, bool isDesktop) {
    return Container(
      margin: EdgeInsets.only(
        right: isDesktop ? 24.0 : 0,
        bottom: isDesktop ? 0 : 24.0,
      ),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.backgroundOffWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppTheme.secondaryAmber,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                stepInfo["step"]!,
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            stepInfo["title"]!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 12),
          Text(
            stepInfo["desc"]!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
