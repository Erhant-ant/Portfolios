import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';

// Masaüstü/tablet geçiş noktası
const double _kDesktopBreakpoint = 900;

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key, this.onScrollToBooks});

  /// Ana sayfadaki kitaplar bölümüne scroll callback'i.
  /// Yalnızca [HomePage] tarafından sağlanır.
  final VoidCallback? onScrollToBooks;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= _kDesktopBreakpoint;

    // Mobilde yatay padding ekranın %5'i, en az 16, en fazla 60
    final hPadding = isDesktop
        ? 60.0
        : (width * 0.05).clamp(16.0, 60.0);

    final navbarHeight = isDesktop ? 72.0 : 60.0;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: navbarHeight,
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: .82),
            border: Border(bottom: BorderSide(color: AppColors.border)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .04),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // Logo / isim
              GestureDetector(
                onTap: () => context.go('/'),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    'ERCAN ANT',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          letterSpacing: isDesktop ? 3 : 2,
                          fontSize: isDesktop ? null : 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                  ),
                ),
              ),

              const Spacer(),

              if (isDesktop) ...[
                // Masaüstü nav linkleri
                _NavItem(
                  label: 'Ana Sayfa',
                  route: '/',
                  onScrollToBooks: null,
                ),
                const SizedBox(width: 8),
                _NavItem(
                  label: 'Kitaplar',
                  route: '/kitaplar',
                  onScrollToBooks: onScrollToBooks,
                ),
                const SizedBox(width: 8),
                _NavItem(
                  label: "Yazarın Defteri",
                  route: '/blog',
                  onScrollToBooks: null,
                ),
                const SizedBox(width: 8),
                _NavItem(
                  label: 'Hakkında',
                  route: '/hakkinda',
                  onScrollToBooks: null,
                ),
                const SizedBox(width: 30),

                // İletişim butonu
                FilledButton(
                  style: FilledButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () => context.go('/iletisim'),
                  child: const Text('İletişim'),
                ),
              ] else ...[
                // Mobil hamburger ikonu
                IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  color: AppColors.textPrimary,
                  tooltip: 'Menü',
                  onPressed: () => _openMobileMenu(context),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _MobileMenuSheet(onScrollToBooks: onScrollToBooks),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Masaüstü nav link item
// ──────────────────────────────────────────────────────────────────────────────

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.label,
    required this.route,
    required this.onScrollToBooks,
  });

  final String label;
  final String route;
  final VoidCallback? onScrollToBooks;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool hover = false;

  void _handleTap() {
    if (widget.route == '/kitaplar') {
      final currentRoute = GoRouterState.of(context).matchedLocation;
      if (currentRoute == '/' && widget.onScrollToBooks != null) {
        // Zaten ana sayfadaysak, direkt scroll — route değişmez
        widget.onScrollToBooks!();
        return;
      }
      // Başka sayfadaysak, extra:true ile git → HomePage scroll yapacak
      context.go('/kitaplar', extra: true);
      return;
    }
    context.go(widget.route);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: hover
                ? AppColors.primary.withValues(alpha: .06)
                : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: hover ? FontWeight.w700 : FontWeight.w500,
                      color: hover ? AppColors.primary : AppColors.textSecondary,
                    ),
                child: Text(widget.label),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: hover ? 28 : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Mobil alt sheet menü
// ──────────────────────────────────────────────────────────────────────────────

class _MobileMenuSheet extends StatelessWidget {
  const _MobileMenuSheet({this.onScrollToBooks});

  final VoidCallback? onScrollToBooks;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tutamaç çizgisi
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            _MobileMenuItem(
              label: 'Ana Sayfa',
              icon: Icons.home_rounded,
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            _MobileMenuItem(
              label: 'Kitaplar',
              icon: Icons.menu_book_rounded,
              onTap: () {
                final currentRoute = GoRouterState.of(context).matchedLocation;
                Navigator.pop(context);
                if (currentRoute == '/' && onScrollToBooks != null) {
                  // Ana sayfadaysak sheet kapandıktan sonra scroll
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => onScrollToBooks!(),
                  );
                } else {
                  context.go('/kitaplar', extra: true);
                }
              },
            ),
            _MobileMenuItem(
              label: "Yazarın Defteri",
              icon: Icons.edit_note_rounded,
              onTap: () {
                Navigator.pop(context);
                context.go('/blog');
              },
            ),
            _MobileMenuItem(
              label: 'Hakkında',
              icon: Icons.person_rounded,
              onTap: () {
                Navigator.pop(context);
                context.go('/hakkinda');
              },
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.mail_outline_rounded),
                label: const Text('İletişim'),
                onPressed: () {
                  Navigator.pop(context);
                  context.go('/iletisim');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  const _MobileMenuItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(width: 16),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
