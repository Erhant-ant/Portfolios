import 'package:ercan_ant/features/blog/domain/blog_post.dart';

class BlogRepository {
  const BlogRepository();

  List<BlogPost> getPosts() {
    return [
      BlogPost(
        id: '1',
        title: 'Yazmak: Bir Tür Suskunluğu Doldurmak',
        excerpt:
            'Bazen bir kelime, yıllarca taşıdığımız bir duyguyu tek hamlede dışarı çeker. Yazmanın bu büyüsünü anlamak için önce suskunluğa kulak vermek gerekiyor.',
        content: '''
Bir yazar olarak her gün boş sayfayla yüzleşirim. O beyaz yüzey hem bir davet hem de bir meydan okuma gibi durur önümde.

Yazmak, aslında bir tür suskunluğu doldurmaktır. İçimizde biriken, adını koyamadığımız duyguların, anıların ve düşüncelerin kelimelerle biçimlenmesidir. Her cümle, ruhumuzun bir köşesine açılan bir penceredir.

"Zemheride Açan Nergisler"i yazarken fark ettim ki en güçlü sahneler, planlamadığım anlarda ortaya çıktı. Ömer'in trende geçirdiği geceyi yazdığımda, sanki ben de o trende oturuyordum. Karakterlerin hayatı bulmak için onu tamamen yalnız bırakmak gerekiyordu.

Edebiyat, hayatın ham gerçekliğini işler ve bize geri verir. Ama bu işleme süreci, yazarı da dönüştürür. Her kitap, yazarının bir parçasını içinde taşır.

Siz de bir şeyler yazmak istiyorsanız, beklemeyin. Mükemmel cümleyi değil, gerçek cümleyi yazın. Çünkü mükemmellik bazen gerçeğin en büyük düşmanıdır.
''',
        date: DateTime(2026, 7, 15),
        category: 'Yazı Üzerine',
        readingMinutes: 4,
      ),

      BlogPost(
        id: '2',
        title: 'Göç: Hem Gidenin Hem Kalanın Hikâyesi',
        excerpt:
            'Göç yalnızca coğrafi bir yer değiştirme değildir. İnsan, gittiği yerde yeniden doğar; kaldığı yerde ise bir parçasını kaybeder.',
        content: '''
Göç meselesini yazmak, benim için hep kişisel bir yolculuk oldu. Ailemden dinlediğim hikâyeler, komşularımın anlattığı acılar... Bunlar bende derin izler bıraktı.

Bir insan iki yerde birden yaşayabilir mi? Hem gittiği yerde hem geride bıraktığında? Bu soruyu kendime defalarca sordum ve cevabın "evet" olduğunu gördüm. Çünkü göç edenler, yeni bir kimlik edinirken eskisini de sırtlarında taşırlar.

"Zemheride Açan Nergisler"de Ömer'in bu ikiliği yaşamasını istedim. O, bir yerde kalmayı, başka bir yerde ise gitmeyi arzular. Bu çatışma, romanın kalbini oluşturur.

Göç hikâyelerini okumak ve yazmak, empati kurmanın en güçlü yollarından biridir. Bir başkasının ayakkabılarıyla yürümek... Edebiyatın bize sunduğu en büyük hediyelerden biri bu değil midir?
''',
        date: DateTime(2026, 6, 3),
        category: 'Düşünceler',
        readingMinutes: 5,
      ),

      BlogPost(
        id: '3',
        title: 'Kış Sabahları ve Okuma Alışkanlığı',
        excerpt:
            'Kışın serin bir sabahında, sıcak bir fincan çay ve iyi bir kitap... Bu üçlünün verdiği huzuru başka hiçbir şey veremez.',
        content: '''
Her sabah gözlerimi açtığımda pencereden dışarı bakarım. Kışın bu ritüel farklı bir anlam taşır. Donmuş camın arkasındaki soluk dünya, bana hep okuma isteği verir.

Bir kitap okumak, başka bir hayata misafir olmaktır. O hayatın sıcaklığını, acısını, sevinçini kendi içimizde hissederiz. Bu yüzden iyi bir kitap, okurun hayatına da bir şeyler katar.

Yıllar içinde geliştirdiğim okuma alışkanlıklarım var. Sabahları kurgusal, akşamları ise deneme ve düşünce kitapları okumayı severim. Sabahın dinginliği, romanların büyüsüne daha açık kılar beni.

Hangi kitabı okursanız okuyun, o kitabın sizi değiştirmesine izin verin. Bir kitabı kapatıp aynı kişi olarak yükseldiyseniz, o kitabı henüz okumamışsınızdır.
''',
        date: DateTime(2026, 5, 20),
        category: 'Okuma Notları',
        readingMinutes: 3,
      ),

      BlogPost(
        id: '4',
        title: 'Roman Karakteri Nasıl Hayat Bulur?',
        excerpt:
            'Karakterler, yazarın zihninde sessizce büyürler. Bir gün, fark etmeden, onlar yazmaya başlar; yazar ise sadece not tutmaya.',
        content: '''
Sık sık sorulur bana: "Karakterleri nasıl yaratıyorsunuz?" Aslında doğru soru bu değil. Çünkü karakterler yaratılmaz, keşfedilir.

Ömer'i ilk hayal ettiğimde, o sadece bir isimdi. Sonra yavaş yavaş bir yüz belirdi; sonra bir ses tonu, bir yürüyüş biçimi, bir korku... Her gün biraz daha gerçek oldu.

Bir karakter gerçek hale geldiğinde, yazar artık onun kararlarını değiştiremez. Ömer bazı sahnelerde benim planladığım yönde gitmeyi reddetti. Sanki kendisi bir irade kazanmıştı. Bu an, bir yazarın en heyecanlı ve en korkutucu anıdır.

Karakterin iç sesi güçlendikçe, diyaloglar da kendiliğinden akar. Artık "bu karakter ne der?" değil, "bu karakter ne duyar?" sorusu sorulur. Ve o sorunun cevabı, romanı yaşatır.
''',
        date: DateTime(2026, 4, 10),
        category: 'Yazı Üzerine',
        readingMinutes: 6,
      ),
    ];
  }
}
