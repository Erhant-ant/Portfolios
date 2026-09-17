# Mehmet Fatih AÇIKÇA - Özel Eğitim Uzmanı Portfolyosu

[![Flutter Web](https://img.shields.io/badge/Platform-Flutter%20Web-02569B?logo=flutter)](https://flutter.dev/)
[![Status](https://img.shields.io/badge/Status-Canlı%20Yayında-4CAF50)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Bu proje, Özel Eğitim Uzmanı **Mehmet Fatih AÇIKÇA** için geliştirilmiş, profesyonel, modern ve tam duyarlı (responsive) bir kişisel web/portfolyo uygulamasıdır. 

Uygulama, standart bir web sitesinin ötesinde; yüksek performanslı, akıcı animasyonlara sahip ve mobil/masaüstü cihazlarda mükemmel bir kullanıcı deneyimi (UX) sunacak şekilde **Flutter Web** kullanılarak tasarlanmıştır.

🔗 **Canlı Demo (Live Preview):** [Tıklayın ve İnceleyin](https://erhant-ant.github.io/mehmet_fatih_acikca_portfolio/)

---

## ✨ Öne Çıkan Özellikler (Features)

- 🎨 **Premium ve Modern Tasarım Dili:** Temiz arayüz (Clean UI), özenle seçilmiş renk paleti (Zeytin Yeşili & Altın Sarısı) ve tipografik hiyerarşi.
- 📱 **Tam Duyarlı (Responsive) Yapı:** Akıllı telefonlardan, tabletlere ve geniş masaüstü monitörlerine kadar her ekranda kusursuz görünüm.
- 🚀 **Yumuşak Geçişler ve Animasyonlar:** Sayfa geçişlerinde, menülerde ve içeriklerin yüklenmesinde göze hoş gelen mikro animasyonlar (`flutter_animate` kütüphanesi).
- 🧩 **Modüler Mimari:** Temiz kod prensiplerine uygun, yeniden kullanılabilir bileşenler (Widgets) ve düzenli klasör yapısı (`core`, `presentation`, `widgets`).
- 🗺️ **Dinamik İçerikler:** Masonry tarzı veli yorumları (Testimonials), interaktif kariyer zaman çizelgesi (Timeline) ve canlı istatistik sayaçları.

## 🛠️ Kullanılan Teknolojiler (Tech Stack)

- **Framework:** [Flutter](https://flutter.dev/) (Dart)
- **Hedef Platform:** Web (HTML/CanvasKit/WASM)
- **Yönlendirme (Routing):** `go_router` (URL tabanlı güvenli sayfa yönlendirmesi)
- **Animasyon:** `flutter_animate`
- **İkonlar & Fontlar:** Google Fonts, Material Icons
- **Deployment:** GitHub Pages (Peanut)

---

## 🚀 Kurulum ve Geliştirme (Installation & Run)

Projeyi bilgisayarınızda yerel olarak (localhost) çalıştırmak için aşağıdaki adımları izleyin:

### Ön Koşullar
- Bilgisayarınızda [Flutter SDK](https://docs.flutter.dev/get-started/install) kurulu olmalıdır.
- Web geliştirme desteği aktif olmalıdır.

### Adımlar

1. **Repoyu Klonlayın:**
   ```bash
   git clone https://github.com/Erhant-ant/mehmet_fatih_acikca_portfolio.git
   cd mehmet_fatih_acikca_portfolio
   ```

2. **Bağımlılıkları Yükleyin:**
   ```bash
   flutter pub get
   ```

3. **Projeyi Tarayıcıda Çalıştırın:**
   ```bash
   flutter run -d chrome
   ```

---

## 🌐 Canlıya Alma (Deployment)

Proje, GitHub Pages üzerinde otomatik olarak barındırılmaktadır. Yeni bir güncellemeyi canlıya almak için `peanut` paketi kullanılmaktadır:

```bash
# Sürümü gh-pages branch'ine derleyin
dart pub global run peanut --extra-args "--base-href=/mehmet_fatih_acikca_portfolio/"

# Değişiklikleri GitHub'a pushlayın
git push origin gh-pages --force
```

---

## 👨‍💻 Geliştirici & Tasarımcı

**Designed & Developed by [Erhan Ant](https://erhant-ant.github.io/erhan_ant_portfolio/)**

Bu portfolyo, eğitim alanındaki hassasiyetler göz önünde bulundurularak velilere "Güven", öğrencilere "Umut" verecek psikolojik bir tasarım felsefesiyle kurgulanmıştır. 
Mimarisi ve kod dizaynı genişletilmeye (yeni sayfalar, randevu formları, CMS entegrasyonu) tamamen açıktır.
