// lib/presentation/pages/reviews_page.dart
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final padding = isDesktop ? screenWidth * 0.15 : 24.0;

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundOffWhite,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // YORUMLAR BÖLÜMÜ
          Text(
            "Veli Yorumları",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "Kişisel verilerin korunması ve çocuk mahremiyeti ilkeleri gereği isimler anonimleştirilmiştir.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildReviewsGrid(context, isDesktop).animate().fade(duration: 600.ms).slideY(begin: 0.1),

          const SizedBox(height: 80),
          const Divider(color: Colors.black12, thickness: 1),
          const SizedBox(height: 80),

          // SIK SORULAN SORULAR BÖLÜMÜ
          Text(
            "Sık Sorulan Sorular (SSS)",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36),
            textAlign: TextAlign.center,
          ).animate(delay: 200.ms).fade().slideY(begin: 0.1),
          const SizedBox(height: 12),
          Text(
            "Özel eğitim ve çalışma süreçlerimiz hakkında en çok merak edilenler.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ).animate(delay: 300.ms).fade().slideY(begin: 0.1),
          const SizedBox(height: 40),
          _buildFAQSection(context).animate(delay: 400.ms).fade(duration: 600.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }

  // --- YORUMLAR (REVIEWS) WIDGET'LARI ---

  Widget _buildReviewsGrid(BuildContext context, bool isDesktop) {
    final reviews = [
      {
        "text": "Fatih Öğretmen ile çalışmaya başladıktan sonra çocuğumuzun hem günlük yaşam becerilerinde hem de akademik süreçlerinde inanılmaz bir sıçrama yaşadık. Önceleri göz teması bile kuramayan oğlumuz şimdi akranlarıyla oyun oynuyor. Bize sadece öğretmenlik değil, yol arkadaşlığı yaptı.",
        "author": "M. K. - 6 Yaş Otizmli Öğrenci Velisi",
      },
      {
        "text": "Disleksi tanısı alan kızım okuldaki derslerden tamamen kopmuştu. Fatih Öğretmen'in detaylı BEP planı, eğlenceli materyalleri ve sabırlı yaklaşımı sayesinde okuma yazma sürecini gözyaşları olmadan, gülümseyerek atlattık. Çocuğumun kendine güveni geri geldi.",
        "author": "A. Y. - 3. Sınıf Öğrenci Velisi",
      },
      {
        "text": "Her çocuğun hızına saygı duyan, güven veren ve asla acele etmeyen bir eğitimci. İlk değerlendirme görüşmesinden itibaren doğru yerde olduğumuzu hissettirdi. Verdiği aile danışmanlığı ile evde kriz anlarını nasıl yöneteceğimizi de bize öğretti.",
        "author": "S. T. - Zihinsel Yetersizlik Tanılı Öğrenci Velisi",
      },
      {
        "text": "Çocuğumuzun hırçınlıkları ve öfke nöbetleri yüzünden evden çıkamaz hale gelmiştik. Davranış değiştirme yöntemleri ve sevgi dolu disiplini ile ailemize huzur getirdi. Kelimelerle teşekkür etmek yetersiz kalır.",
        "author": "R. C. - Veli",
      }
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: reviews.map((review) {
        return SizedBox(
          width: isDesktop ? 350 : double.infinity,
          child: _buildReviewCard(context, review),
        );
      }).toList(),
    );
  }

  Widget _buildReviewCard(BuildContext context, Map<String, String> review) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 12),
          )
        ],
      ),
      child: Stack(
        children: [
          // Arka plan filigranı (Quote icon)
          Positioned(
            top: -10,
            right: -10,
            child: Icon(Icons.format_quote_rounded, color: AppTheme.primaryGreen.withOpacity(0.05), size: 100),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Yıldızlar
              Row(
                children: List.generate(5, (index) => const Icon(Icons.star_rounded, color: AppTheme.secondaryAmber, size: 24)),
              ),
              const SizedBox(height: 24),
              // Yorum Metni
              Text(
                "\"${review["text"]!}\"",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                  color: AppTheme.textDarkGrey.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 24),
              // Yazar
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        review["author"]!.substring(0, 1),
                        style: const TextStyle(color: AppTheme.primaryGreen, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      review["author"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryGreen, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- SIK SORULAN SORULAR (FAQ) WIDGET'LARI ---

  Widget _buildFAQSection(BuildContext context) {
    final faqs = [
      {
        "question": "BEP (Bireyselleştirilmiş Eğitim Programı) nedir?",
        "answer": "BEP, özel eğitim ihtiyacı olan öğrencinin gelişim özellikleri, eğitim ihtiyaçları ve performans düzeyleri dikkate alınarak hazırlanan, ona özgü hedefleri ve bu hedeflere ulaşmak için kullanılacak yöntemleri içeren resmi bir eğitim planıdır."
      },
      {
        "question": "İlk görüşme ve değerlendirme süreci nasıl yapılıyor?",
        "answer": "İlk görüşmede öncelikle aile ile tanışılır, öğrencinin mevcut durumu, RAM raporları ve eğitim geçmişi incelenir. Ardından öğrenciyle oyun veya eğitsel etkinlikler üzerinden standartlaştırılmamış bir gözlem yapılır. Bu aşama tıbbi bir tanı koyma süreci değil, eğitimsel ihtiyaç belirleme sürecidir."
      },
      {
        "question": "RAM (Rehberlik ve Araştırma Merkezi) raporu süreci nasıl işler?",
        "answer": "Özel eğitim ve rehabilitasyon hizmetlerinden ücretsiz yararlanabilmek veya kaynaştırma eğitimi kararı aldırabilmek için hastane sağlık kurulu raporunun ardından ilçenizdeki RAM'a başvurulması gerekir. Bu süreçte ailelere gerekli yönlendirme ve resmi işleyiş hakkında rehberlik sağlamaktayım."
      },
      {
        "question": "Eğitim sürecine ailenin katılımı zorunlu mu?",
        "answer": "Zorunlu olmamakla birlikte, eğitimin kalıcılığı ve ev ortamına genellenebilmesi için son derece kritiktir. Aile, eğitimin en büyük paydaşıdır. Bu nedenle 'Aile Eğitimi ve Danışmanlık' boyutu çalışmalarımın ayrılmaz bir parçasıdır."
      },
      {
        "question": "Dersler ne kadar sürüyor ve hangi sıklıkla yapılıyor?",
        "answer": "Bir özel eğitim seansı genellikle 40-45 dakika sürer. Seans sıklığı ise öğrencinin BEP hedeflerine, yaşına ve dikkat süresine göre değerlendirme sonrasında aile ile birlikte planlanır."
      }
    ];

    return Column(
      children: faqs.map((faq) => _buildFAQAccordion(context, faq)).toList(),
    );
  }

  Widget _buildFAQAccordion(BuildContext context, Map<String, String> faq) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        // Açıldığında kenarlarda oluşan çizgileri kaldırmak için
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          iconColor: AppTheme.primaryGreen,
          collapsedIconColor: AppTheme.textDarkGrey,
          title: Text(
            faq["question"]!,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: AppTheme.textDarkGrey),
          ),
          childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          expandedAlignment: Alignment.centerLeft,
          children: [
            Text(
              faq["answer"]!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}