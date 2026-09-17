// lib/presentation/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    // 900px altını mobil/tablet kabul edelim
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return AppBar(
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.go('/'),
            child: Row(
              children: [
                // Premium İkon Alanı
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.primaryGreen, AppTheme.primaryGreen.withOpacity(0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryGreen.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.psychology_alt, color: Colors.white, size: 28), // Nöroçeşitliliği ve zihni temsil eden ikon
                ),
                const SizedBox(width: 16),
                // Tipografik Yazı Alanı
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 22,
                          letterSpacing: -0.5,
                        ),
                        children: [
                          const TextSpan(
                            text: "MEHMET ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900, // Kalın vurgu
                              color: AppTheme.textDarkGrey,
                            ),
                          ),
                          TextSpan(
                            text: "FATİH ",
                            style: TextStyle(
                              fontWeight: FontWeight.w300, // İnce zarif vurgu
                              color: AppTheme.primaryGreen,
                            ),
                          ),
                          const TextSpan(
                            text: "AÇIKÇA",
                            style: TextStyle(
                              fontWeight: FontWeight.w900, // Kalın vurgu
                              color: AppTheme.textDarkGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "ÖZEL EĞİTİM ÖĞRETMENİ",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[500],
                        fontSize: 10,
                        letterSpacing: 2.0, // Harfler arası boşlukla premium hava
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: isDesktop ? _buildDesktopMenu(context) : null,
    );
  }

  List<Widget> _buildDesktopMenu(BuildContext context) {
    final menuItems = {
      'Ana Sayfa': '/',
      'Hakkımda': '/hakkimda',
      'Çalışma Alanları': '/hizmetler',
      'Videolar': '/videolar',
      'Yorumlar & SSS': '/yorumlar',
    };

    return [
      ...menuItems.entries.map((entry) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: _HoverTextButton(
          text: entry.key,
          onPressed: () => context.go(entry.value),
        ),
      )),
      const SizedBox(width: 16),
      Padding(
        padding: const EdgeInsets.only(right: 32.0, left: 8.0, top: 16.0, bottom: 16.0),
        child: ElevatedButton.icon(
          onPressed: () => context.go('/iletisim'),
          icon: const Icon(Icons.calendar_today, size: 18),
          label: const Text("İletişim / Randevu"),
        ),
      ),
    ];
  }
}

class _HoverTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  
  const _HoverTextButton({required this.text, required this.onPressed});

  @override
  State<_HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<_HoverTextButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextButton(
        onPressed: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_isHovering ? 1.05 : 1.0),
          child: Text(
            widget.text, 
            style: TextStyle(
              fontWeight: FontWeight.w600, 
              color: _isHovering ? AppTheme.primaryGreen : AppTheme.textDarkGrey,
            ),
          ),
        ),
      ),
    );
  }
}