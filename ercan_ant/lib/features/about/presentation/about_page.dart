import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/shared/layout/app_layout.dart';
import 'package:ercan_ant/shared/widgets/app_footer.dart';
import 'package:ercan_ant/shared/widgets/app_navbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const AppNavbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero bölümü
                  _AboutHero(theme: theme),

                  // Biyografi bölümü
                  _BiographySection(theme: theme),

                  // Alıntı bölümü
                  _QuoteSection(theme: theme),

                  // Kitaplarım bölümü
                  _BooksCTA(theme: theme),

                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  const _AboutHero({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffFCF8F1), Color(0xffF8F3EB), Color(0xffF3ECE2)],
        ),
      ),
      child: AppLayout(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 900;
            if (isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _AuthorAvatar(),
                  const SizedBox(height: 40),
                  _HeroText(theme: theme),
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: _HeroText(theme: theme)),
                const SizedBox(width: 80),
                Expanded(flex: 4, child: Center(child: _AuthorAvatar())),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AuthorAvatar extends StatefulWidget {
  @override
  State<_AuthorAvatar> createState() => _AuthorAvatarState();
}

class _AuthorAvatarState extends State<_AuthorAvatar> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 5))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, (_ctrl.value - 0.5) * 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow arkaplanı
              Container(
                width: 380,
                height: 380,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: .18),
                      AppColors.primary.withValues(alpha: .06),
                      Colors.transparent,
                    ],
                    stops: const [.15, .5, 1],
                  ),
                ),
              ),

              // Avatar çerçevesi
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withValues(alpha: .3), width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: .15),
                      blurRadius: 40,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Container(
                    color: AppColors.primary.withValues(alpha: .1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_rounded,
                          size: 110,
                          color: AppColors.primary.withValues(alpha: .6),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'ERCAN ANT',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.primary.withValues(alpha: .7),
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Dekoratif rozet
              Positioned(
                bottom: 50,
                right: 30,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: .4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.auto_stories_rounded, size: 16, color: Colors.white),
                      const SizedBox(width: 6),
                      Text(
                        'Yazar',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primary.withValues(alpha: .15)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_outline_rounded, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                'Hakkında',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        Text(
          'Ercan Ant',
          style: theme.textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),

        const SizedBox(height: 20),

        Container(width: 70, height: 4, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10))),

        const SizedBox(height: 26),

        Text(
          'Roman yazarı. Umudun, aidiyetin ve göçün sessiz yankılarını kelimelere döken biri.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.85, color: AppColors.textPrimary),
        ),

        const SizedBox(height: 18),

        // Sosyal linkler
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _SocialChip(icon: Icons.book_outlined, label: 'Goodreads'),
            _SocialChip(icon: Icons.alternate_email_rounded, label: 'Instagram'),
            _SocialChip(icon: Icons.language_rounded, label: 'Twitter / X'),
          ],
        ),
      ],
    );
  }
}

class _SocialChip extends StatefulWidget {
  const _SocialChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  State<_SocialChip> createState() => _SocialChipState();
}

class _SocialChipState extends State<_SocialChip> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _hover ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: _hover ? AppColors.primary : AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 16, color: _hover ? Colors.white : AppColors.textSecondary),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _hover ? Colors.white : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BiographySection extends StatelessWidget {
  const _BiographySection({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.giant, horizontal: 32),
      child: AppLayout(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 800;

            final paragraphs = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hayat ve Edebiyat Yolculuğu',
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 28),
                _para(theme,
                    'Ercan Ant, insanın iç dünyasını ve toplumsal bağlarını konu alan romanlarıyla edebiyat dünyasında sesini duyurmuş bir yazardır. Yazılarında umut, aidiyet ve göç gibi evrensel temaları işler; okuyucuyu farklı hayatların içine çeker.'),
                _para(theme,
                    'İlk romanı "Zemheride Açan Nergisler", yayımlandığı günden bu yana büyük ilgi görmüş; hem eleştirmenler hem de okuyucular tarafından güçlü bir edebî ses olarak değerlendirilmiştir. Roman, insan ruhunun karanlık ve aydınlık yönlerini ustalıkla dengeleyen bir anlatı yapısına sahiptir.'),
                _para(theme,
                    'Yazma sürecinde hayatın sıradan anlarından beslenen Ant, her karakterinin gerçek ve bütünlüklü hissetmesi için derinlemesine araştırma yapar. "Her karakter, bir insanın içinde yaşayan başka bir insan" anlayışıyla yaklaşır yazmaya.'),
                _para(theme,
                    'Yeni romanı üzerindeki çalışmalarını sürdürmekte olan Ercan Ant, "Yazarın Defteri" bölümünde yazma sürecine dair notlarını, düşüncelerini ve okuma tavsiyelerini paylaşmaktadır.'),
              ],
            );

            final stats = Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                _StatCard(number: '1', label: 'Yayımlanan\nRoman'),
                _StatCard(number: '4+', label: 'Blog\nYazısı'),
                _StatCard(number: '∞', label: 'Anlatılacak\nHikâye'),
              ],
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 6, child: paragraphs),
                  const SizedBox(width: 60),
                  Expanded(flex: 4, child: stats),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [paragraphs, const SizedBox(height: 40), stats],
            );
          },
        ),
      ),
    );
  }

  Widget _para(ThemeData theme, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: Text(text, style: theme.textTheme.bodyLarge?.copyWith(height: 1.9, color: AppColors.textPrimary)),
      );
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.number, required this.label});
  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 140,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: theme.textTheme.displayLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              fontSize: 52,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _QuoteSection extends StatelessWidget {
  const _QuoteSection({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.huge, horizontal: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: .85),
            const Color(0xff6B4E2E),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Icon(Icons.format_quote, size: 56, color: Colors.white.withValues(alpha: .4)),
              const SizedBox(height: 20),
              Text(
                '"Her insan biraz gittiği yollar,\nbiraz da geride bıraktıklarıdır."',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '— Ercan Ant',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white.withValues(alpha: .7),
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BooksCTA extends StatelessWidget {
  const _BooksCTA({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundSecondary,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.huge, horizontal: 32),
      child: Center(
        child: Column(
          children: [
            Text(
              'Eserlerimi Keşfedin',
              style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: Text(
                'Romanlarım ve yakında çıkacak eserlerim hakkında daha fazla bilgi almak için kitaplar sayfasını ziyaret edin.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.8, color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 36),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: () => context.go('/kitaplar'),
                  icon: const Icon(Icons.menu_book_rounded),
                  label: const Text('Kitapları Gör'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(200, 54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => context.go('/blog'),
                  icon: const Icon(Icons.edit_note_rounded),
                  label: const Text('Yazarın Defteri'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
