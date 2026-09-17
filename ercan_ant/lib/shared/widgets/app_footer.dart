import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/shared/layout/app_layout.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFF2A1F14),
      child: AppLayout(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: AppSpacing.huge),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 750;
              if (isMobile) return _MobileFooter(theme: theme);
              return _DesktopFooter(theme: theme);
            },
          ),
        ),
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sol: Marka
            Expanded(flex: 4, child: _BrandColumn(theme: theme)),
            const SizedBox(width: 48),

            // Orta: Navigasyon
            Expanded(flex: 2, child: _LinksColumn(title: 'Bölümler', theme: theme, links: const [
              _FooterLink(label: 'Ana Sayfa', route: '/'),
              _FooterLink(label: 'Kitaplar', route: '/kitaplar'),
              _FooterLink(label: 'Yazarın Defteri', route: '/blog'),
              _FooterLink(label: 'Hakkında', route: '/hakkinda'),
            ])),
            const SizedBox(width: 48),

            // Sağ: İletişim
            Expanded(flex: 3, child: _ContactColumn(theme: theme)),
          ],
        ),

        const SizedBox(height: AppSpacing.xxl),
        _Divider(),
        const SizedBox(height: AppSpacing.lg),
        _CopyrightRow(theme: theme),
      ],
    );
  }
}

class _MobileFooter extends StatelessWidget {
  const _MobileFooter({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BrandColumn(theme: theme),
        const SizedBox(height: 40),
        _LinksColumn(title: 'Bölümler', theme: theme, links: const [
          _FooterLink(label: 'Ana Sayfa', route: '/'),
          _FooterLink(label: 'Kitaplar', route: '/kitaplar'),
          _FooterLink(label: 'Yazarın Defteri', route: '/blog'),
          _FooterLink(label: 'Hakkında', route: '/hakkinda'),
        ]),
        const SizedBox(height: 40),
        _ContactColumn(theme: theme),
        const SizedBox(height: AppSpacing.xxl),
        _Divider(),
        const SizedBox(height: AppSpacing.lg),
        _CopyrightRow(theme: theme),
      ],
    );
  }
}

class _BrandColumn extends StatelessWidget {
  const _BrandColumn({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ERCAN ANT',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Yazar · Roman · Hikâye',
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white38,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Container(width: 50, height: 3, color: AppColors.secondary),
        const SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: Text(
            'Kelimelerin bıraktığı izleri takip edin. Edebiyatın sıcaklığında buluşalım.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Sosyal medya ikonları
        Row(
          children: [
            _SocialIcon(icon: Icons.auto_stories_rounded, tooltip: 'Goodreads'),
            const SizedBox(width: 12),
            _SocialIcon(icon: Icons.alternate_email_rounded, tooltip: 'Instagram'),
            const SizedBox(width: 12),
            _SocialIcon(icon: Icons.language_rounded, tooltip: 'Twitter / X'),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  const _SocialIcon({required this.icon, required this.tooltip});
  final IconData icon;
  final String tooltip;

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Tooltip(
        message: widget.tooltip,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: _hover ? AppColors.primary : Colors.white.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _hover ? AppColors.primary : Colors.white.withValues(alpha: .12)),
          ),
          child: Icon(
            widget.icon,
            size: 18,
            color: _hover ? Colors.white : Colors.white54,
          ),
        ),
      ),
    );
  }
}

class _FooterLink {
  const _FooterLink({required this.label, required this.route});
  final String label;
  final String route;
}

class _LinksColumn extends StatelessWidget {
  const _LinksColumn({required this.title, required this.theme, required this.links});
  final String title;
  final ThemeData theme;
  final List<_FooterLink> links;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white38,
            letterSpacing: 2,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => _FooterNavItem(link: link, theme: theme)),
      ],
    );
  }
}

class _FooterNavItem extends StatefulWidget {
  const _FooterNavItem({required this.link, required this.theme});
  final _FooterLink link;
  final ThemeData theme;

  @override
  State<_FooterNavItem> createState() => _FooterNavItemState();
}

class _FooterNavItemState extends State<_FooterNavItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => context.go(widget.link.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 180),
            style: widget.theme.textTheme.bodyMedium!.copyWith(
              color: _hover ? AppColors.secondary : Colors.white60,
            ),
            child: Text(widget.link.label),
          ),
        ),
      ),
    );
  }
}

class _ContactColumn extends StatelessWidget {
  const _ContactColumn({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İLETİŞİM',
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white38,
            letterSpacing: 2,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 16),
        _contactRow(Icons.email_outlined, 'ercanant@example.com'),
        const SizedBox(height: 12),
        _contactRow(Icons.location_on_outlined, 'Türkiye'),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .15),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.primary.withValues(alpha: .25)),
          ),
          child: Row(
            children: [
              Icon(Icons.notifications_none_rounded, size: 20, color: AppColors.secondary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Yeni eserleri takip etmek için iletişime geçin.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white60,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white38),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(color: Colors.white60, fontSize: 14)),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: Colors.white.withValues(alpha: .08));
  }
}

class _CopyrightRow extends StatelessWidget {
  const _CopyrightRow({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© 2026 Ercan Ant. Tüm hakları saklıdır.',
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.white30),
        ),
        Text(
          'Kelimelerin bıraktığı izler',
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: .2),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
