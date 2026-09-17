// lib/presentation/pages/about_page.dart
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final padding = isDesktop ? screenWidth * 0.1 : 24.0;

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundOffWhite,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlık Alanı
          Text(
            "Benim Hikayem",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 40),
          ).animate().fade(duration: 600.ms).slideX(begin: -0.1),
          const SizedBox(height: 40),

          // Üst Kısım: Fotoğraf ve Metin
          (isDesktop ? _buildDesktopIntro(context) : _buildMobileIntro(context))
              .animate(delay: 100.ms).fade().slideY(begin: 0.1),
          
          const SizedBox(height: 80),

          // İstatistikler / Sayaçlar
          _buildStatsSection(context, isDesktop)
              .animate(delay: 200.ms).fade().scale(),

          const SizedBox(height: 80),

          // Kariyer Yolculuğu (Timeline)
          _buildTimelineSection(context)
              .animate(delay: 300.ms).fade().slideY(begin: 0.1),

          const SizedBox(height: 80),

          // Eğitim Felsefesi (Alıntı stili)
          _buildPhilosophySection(context)
              .animate(delay: 400.ms).fade().slideY(begin: 0.1),

          const SizedBox(height: 80),

          // Çalışma Ortamından Kareler (Galeri)
          _buildGallerySection(context, isDesktop)
              .animate(delay: 450.ms).fade().slideY(begin: 0.1),

          const SizedBox(height: 80),

          // Call to Action (Randevu)
          _buildCTASection(context)
              .animate(delay: 500.ms).fade().scale(),
        ],
      ),
    );
  }

  Widget _buildDesktopIntro(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: _buildProfileImage(),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 6,
          child: _buildIntroText(context),
        ),
      ],
    );
  }

  Widget _buildMobileIntro(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(),
        const SizedBox(height: 40),
        _buildIntroText(context),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 450,
      width: double.infinity,
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
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter, // Fotoğrafın üst kısmını (kafayı) kırpmaması için
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.person_outline, size: 80, color: Colors.black26),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIntroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Merhaba, ben ${AppConstants.teacherName}.",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppTheme.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.teacherTitle.toUpperCase(),
          style: TextStyle(
            color: AppTheme.secondaryAmber,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "Marmara Üniversitesi Özel Eğitim Öğretmenliği bölümünden mezun olduktan sonra, 8 yılı aşkın süredir özel eğitim ihtiyacı olan bireylerin hayatlarına dokunmak için sahada aktif olarak çalışıyorum.\n\nUzmanlık alanım; zihinsel özel eğitim ihtiyacı olan bireylerin akademik ve sosyal becerilerini geliştirmek, onlara özel Bireyselleştirilmiş Eğitim Programları (BEP) hazırlamak ve bu süreçte ailelere rehberlik etmektir. Çünkü inanıyorum ki eğitim, evde başlar ve sevgiyle büyür.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem("8+", "Yıl Deneyim", Icons.workspace_premium),
          if (isDesktop) _buildVerticalDivider() else const SizedBox(height: 30),
          _buildStatItem("300+", "Özel Eğitim Programı", Icons.assignment_turned_in),
          if (isDesktop) _buildVerticalDivider() else const SizedBox(height: 30),
          _buildStatItem("%100", "Aile İş Birliği", Icons.family_restroom),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 60, width: 1, color: Colors.grey[300]);
  }

  Widget _buildStatItem(String number, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryGreen, size: 40),
        const SizedBox(height: 16),
        Text(number, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppTheme.textDarkGrey)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTimelineSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kariyer Yolculuğum", style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 40),
        _buildTimelineItem(
          context: context,
          year: "2013",
          title: "Marmara Üniversitesi",
          description: "Özel Eğitim Öğretmenliği lisans eğitimime başlayarak mesleki temellerimi atmaya başladım.",
          isLast: false,
        ),
        _buildTimelineItem(
          context: context,
          year: "2018",
          title: "Mezuniyet & Profesyonel Kariyer",
          description: "Üniversiteden başarıyla mezun olarak sahada aktif olarak eğitim vermeye ve çocukların hayatlarına dokunmaya başladım.",
          isLast: false,
        ),
        _buildTimelineItem(
          context: context,
          year: "Günümüz",
          title: "Bireysel Özel Eğitim Uzmanı",
          description: "8 yılı aşkın deneyimim, güncel sertifikalarım ve aile danışmanlıkları ile çocukların benzersiz potansiyellerini ortaya çıkarmaya devam ediyorum.",
          isLast: true,
          isHighlight: true,
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required BuildContext context,
    required String year,
    required String title,
    required String description,
    required bool isLast,
    bool isHighlight = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Çizgi ve Nokta kısmı
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isHighlight ? AppTheme.secondaryAmber : AppTheme.primaryGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(color: (isHighlight ? AppTheme.secondaryAmber : AppTheme.primaryGreen).withOpacity(0.5), blurRadius: 8),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: AppTheme.primaryGreen.withOpacity(0.3)),
                ),
            ],
          ),
          const SizedBox(width: 24),
          // İçerik kısmı
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(year, style: TextStyle(color: isHighlight ? AppTheme.secondaryAmber : AppTheme.primaryGreen, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(description, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophySection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Icon(Icons.format_quote_rounded, color: Colors.white24, size: 60),
          const SizedBox(height: 16),
          Text(
            "Her çocuğun öğrenme hızı, stili ve potansiyeli parmak izi kadar benzersizdir. Amacım, onların kendi renkleriyle çiçek açabilecekleri, sevgi ve sabırla yoğrulmuş güvenli bir alan yaratmaktır.",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Text(
            "- Mehmet Fatih Açıkça",
            style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            const Icon(Icons.forum_outlined, color: AppTheme.primaryGreen, size: 48),
            const SizedBox(height: 24),
            Text(
              "Çocuğunuzun Potansiyelini Birlikte Keşfedelim",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Eğitim sürecini, beklentilerinizi ve yapabileceklerimizi konuşmak için ücretsiz bir ön görüşme ayarlayabilirsiniz.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.go('/iletisim');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text("Hemen İletişime Geçin", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGallerySection(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Çalışma Ortamından Kareler", style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          "Eğitim süreçlerimizi yürüttüğümüz güvenli, eğlenceli ve öğretici ortamlarımız.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDesktop ? 3 : 1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 4 / 3, // Geniş dikdörtgen görünüm
          ),
          itemCount: 3, // Şimdilik 3 resim
          itemBuilder: (context, index) {
            // İleride assets/images/gallery_1.jpg gibi yapabilirsiniz
            final imagePath = 'assets/images/gallery_${index + 1}.jpg';
            
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_library_outlined, size: 40, color: AppTheme.primaryGreen.withOpacity(0.5)),
                          const SizedBox(height: 8),
                          Text(
                            "Resim Bekleniyor\n($imagePath)",
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}