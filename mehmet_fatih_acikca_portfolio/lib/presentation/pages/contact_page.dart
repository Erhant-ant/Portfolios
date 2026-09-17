// lib/presentation/pages/contact_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/google_map_embed.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Form kontrolü için anahtar ve veri tutucular (Controllers)
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // Dış bağlantıları (Tel, Mail, Harita vb.) açmak için yardımcı fonksiyon
  Future<void> _launch(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Açılamadı: $urlString");
    }
  }

  // Form Gönderim İşlemi (Şimdilik mailto tetikler, backend adımında güncellenebilir)
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final body = "Ad Soyad: $name\nTelefon: ${_phoneController.text}\nE-posta: ${_emailController.text}\n\nMesaj:\n${_messageController.text}";
      
      final mailtoUri = Uri(
        scheme: 'mailto',
        path: AppConstants.contactEmail,
        query: 'subject=Web Sitesi İletişim Formu: $name&body=${Uri.encodeComponent(body)}',
      );
      
      _launch(mailtoUri.toString());
      
      // Formu temizle ve kullanıcıya bilgi ver
      _formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mesajınız e-posta uygulamanıza aktarıldı. Teşekkürler!"),
          backgroundColor: AppTheme.primaryGreen,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
          Center(
            child: Text(
              "İletişim ve Randevu",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              "Değerlendirme görüşmesi, bilgi ve randevu talepleriniz için bana ulaşabilirsiniz.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),

          // Masaüstünde Yanyana (Row), Mobilde Alt Alta (Column) Dizilim
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _buildContactInfo(context).animate().fade(duration: 600.ms).slideX(begin: -0.1)),
                const SizedBox(width: 80),
                Expanded(flex: 5, child: _buildContactForm(context).animate(delay: 200.ms).fade(duration: 600.ms).slideX(begin: 0.1)),
              ],
            )
          else
            Column(
              children: [
                _buildContactInfo(context).animate().fade(duration: 600.ms).slideY(begin: 0.1),
                const SizedBox(height: 60),
                _buildContactForm(context).animate(delay: 200.ms).fade(duration: 600.ms).slideY(begin: 0.1),
              ],
            ),
        ],
      ),
    );
  }

  // --- SOL/ÜST PANEL: İletişim Bilgileri ve Harita ---

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("İletişim Bilgileri", style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 32),
        _buildInfoTile(
          icon: Icons.location_on,
          title: "Çalışma Adresi",
          content: AppConstants.contactAddress,
          onTap: () => _launch("https://maps.google.com/?q=${Uri.encodeComponent(AppConstants.contactAddress)}"),
        ),
        _buildInfoTile(
          icon: Icons.phone,
          title: "Telefon",
          content: AppConstants.contactPhone,
          onTap: () => _launch("tel:${AppConstants.contactPhone}"),
        ),
        _buildInfoTile(
          icon: Icons.chat,
          title: "WhatsApp",
          content: "+${AppConstants.contactWhatsApp}",
          onTap: () => _launch("https://wa.me/${AppConstants.contactWhatsApp}"),
        ),
        _buildInfoTile(
          icon: Icons.email,
          title: "E-posta",
          content: AppConstants.contactEmail,
          onTap: () => _launch("mailto:${AppConstants.contactEmail}"),
        ),
        
        const SizedBox(height: 40),
        
        // Gerçek ve Etkileşimli Google Haritası
        Container(
          width: double.infinity,
          height: 300, // Haritanın rahat görünmesi için biraz daha yüksek
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const GoogleMapEmbed(address: AppConstants.contactAddress),
        ),
      ],
    );
  }

  Widget _buildInfoTile({required IconData icon, required String title, required String content, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppTheme.primaryGreen.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, color: AppTheme.primaryGreen, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(content, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDarkGrey)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // --- SAĞ/ALT PANEL: İletişim Formu ---

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 10))
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mesaj Gönderin", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 24),
            
            _buildTextField(controller: _nameController, label: "Adınız Soyadınız", icon: Icons.person),
            const SizedBox(height: 16),
            
            _buildTextField(controller: _phoneController, label: "Telefon Numaranız", icon: Icons.phone, isPhone: true),
            const SizedBox(height: 16),
            
            _buildTextField(controller: _emailController, label: "E-posta Adresiniz (İsteğe Bağlı)", icon: Icons.email, isRequired: false),
            const SizedBox(height: 16),
            
            _buildTextField(controller: _messageController, label: "Mesajınız (Eğitim geçmişi, yaş, beklentiler vb.)", icon: Icons.message, isMultiline: true),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text("Gönder"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isMultiline = false,
    bool isPhone = false,
    bool isRequired = true,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: isMultiline ? 5 : 1,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: isMultiline ? null : Icon(icon, color: AppTheme.primaryGreen),
        alignLabelWithHint: true, // Çoklu satırda label'ı yukarı yaslar
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppTheme.primaryGreen, width: 2)),
        filled: true,
        fillColor: AppTheme.backgroundOffWhite,
      ),
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return "Bu alan zorunludur.";
        }
        return null;
      },
    );
  }
}