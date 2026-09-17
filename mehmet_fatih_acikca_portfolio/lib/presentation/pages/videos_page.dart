// lib/presentation/pages/videos_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  // Filtreleme için kullanılacak aktif kategori
  String _selectedCategory = "Tümü";

  // Kategoriler
  final List<String> _categories = [
    "Tümü",
    "BEP Uygulaması",
    "Aile Eğitimi",
    "Sınıf İçi Etkinlik"
  ];

  // Video Veri Modeli (Gerçek projede Firebase'den veya bir API'den çekilecek)
  final List<Map<String, String>> _videoList = [
    {
      "title": "İnce Motor Becerileri Gelişimi - Yapboz Etkinliği",
      "category": "BEP Uygulaması",
      "altText": "Öğrenci ile masada yapboz çalışması yapılırken çekilmiş video.",
      "url": "https://youtube.com/watch?v=placeholder1",
    },
    {
      "title": "Evde Eğitim Ortamı Nasıl Hazırlanır?",
      "category": "Aile Eğitimi",
      "altText": "Ailelere yönelik ev ortamı düzenleme ipuçları.",
      "url": "https://youtube.com/watch?v=placeholder2",
    },
    {
      "title": "Sıra Bekleme ve Yönerge Takibi",
      "category": "Sınıf İçi Etkinlik",
      "altText": "Sınıf içerisinde oyun oynarken sıra bekleme çalışması.",
      "url": "https://youtube.com/watch?v=placeholder3",
    },
    {
      "title": "Eşleme Becerileri Çalışması",
      "category": "BEP Uygulaması",
      "altText": "Kartlarla nesne eşleme çalışması yapan öğrenci.",
      "url": "https://youtube.com/watch?v=placeholder4",
    },
  ];

  // Video linkini dışarıda (YouTube uygulamasında/sekmesinde) açmak için
  Future<void> _launchVideo(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint("Video açılamadı: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final padding = isDesktop ? screenWidth * 0.1 : 24.0;

    // Seçili kategoriye göre videoları filtrele
    final filteredVideos = _selectedCategory == "Tümü"
        ? _videoList
        : _videoList.where((v) => v["category"] == _selectedCategory).toList();

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundOffWhite,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sayfa Başlığı
          Center(
            child: Text(
              "Çalışma Videoları",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36),
            ),
          ),
          const SizedBox(height: 24),

          // ÖNEMLİ: KVKK ve Mahremiyet Uyarısı
          _buildKvkkWarning(context),
          const SizedBox(height: 40),

          // Kategori Filtreleme Çubuğu
          _buildFilterBar(),
          const SizedBox(height: 40),

          // Videoların Listelendiği Grid (Izgara) Yapısı
          filteredVideos.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text("Bu kategoriye ait video bulunamadı."),
                  ),
                )
              : _buildVideoGrid(isDesktop, filteredVideos).animate().fade(duration: 500.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }

  Widget _buildKvkkWarning(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.secondaryAmber.withOpacity(0.1),
        border: Border.all(color: AppTheme.secondaryAmber.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.privacy_tip, color: AppTheme.secondaryAmber, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              AppConstants.kvkkDisclaimer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.brown[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: _categories.map((category) {
          final isSelected = _selectedCategory == category;
          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                setState(() => _selectedCategory = category);
              }
            },
            selectedColor: AppTheme.primaryGreen,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textDarkGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? AppTheme.primaryGreen : Colors.grey.shade300,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVideoGrid(bool isDesktop, List<Map<String, String>> videos) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 3 : 1, // Masaüstünde 3 sütun, mobilde 1
        crossAxisSpacing: 24,
        mainAxisSpacing: 32,
        childAspectRatio: 1.1, // Kartın en/boy oranı
      ),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return _buildVideoCard(video);
      },
    );
  }

  Widget _buildVideoCard(Map<String, String> video) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchVideo(video["url"]!),
        // Erişilebilirlik (Görme engelliler için ekran okuyucu metni)
        child: Semantics(
          label: "${video["title"]} - ${video["altText"]}",
          button: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail (Video Kapak Görseli Alanı)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                      ),
                      // Play İkonu
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow, color: AppTheme.primaryGreen, size: 36),
                      ),
                      // Etiket (Kategori)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryAmber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            video["category"]!,
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Video Başlığı ve Alt Metni
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video["title"]!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        video["altText"]!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600], fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}