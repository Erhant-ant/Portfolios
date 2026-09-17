import 'package:flutter/material.dart';
import '../widgets/home/hero_section.dart';
import '../widgets/home/expertise_section.dart';
import '../widgets/home/process_roadmap_section.dart';
import '../widgets/home/educational_values_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Karşılama Alanı (Hero)
          HeroSection(),
          
          // 2. Eğitim Felsefesi ve Yaklaşım (GÜVEN İNŞASI)
          EducationalValuesSection(),
          
          // 3. Çalışma ve Uzmanlık Alanları Kartları
          ExpertiseSection(),
          
          // 4. Süreç Nasıl İşliyor? - Yol Haritası (KAYGI GİDERME)
          ProcessRoadmapSection(),
        ],
      ),
    );
  }
}
