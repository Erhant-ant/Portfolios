import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/shared/layout/app_layout.dart';

/// Ana sayfada yazarı kısa tanıtan bölüm
class AboutTeaser extends StatelessWidget {
  const AboutTeaser({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: AppColors.backgroundSecondary,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.huge, horizontal: 32),
      child: AppLayout(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 900;
            if (isMobile) return _MobileLayout(theme: theme);
            return _DesktopLayout(theme: theme);
          },
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _TextContent(theme: theme)),
        const SizedBox(width: 70),
        Expanded(flex: 4, child: _QuoteCard(theme: theme)),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextContent(theme: theme),
        const SizedBox(height: 40),
        _QuoteCard(theme: theme),
      ],
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
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
                'Yazar Hakkında',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Ercan Ant',
          style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
        ),

        const SizedBox(height: 16),

        Container(width: 60, height: 3, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10))),

        const SizedBox(height: 20),

        Text(
          'Roman yazarı. İnsan ruhunun derinliklerini, göçün izlerini ve aidiyetin sessiz sesini kelimelere dökmek için yazan biri.',
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.9,
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 32),

        OutlinedButton.icon(
          onPressed: () => context.go('/hakkinda'),
          icon: const Icon(Icons.arrow_forward_rounded, size: 18),
          label: const Text('Daha Fazla Bilgi'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
          ),
        ),
      ],
    );
  }
}

class _QuoteCard extends StatelessWidget {
  const _QuoteCard({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote_rounded, size: 40, color: AppColors.primary.withValues(alpha: .4)),
          const SizedBox(height: 16),
          Text(
            '"Her insan biraz gittiği yollar, biraz da geride bıraktıklarıdır."',
            style: theme.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.6,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: .1),
                  border: Border.all(color: AppColors.primary.withValues(alpha: .2)),
                ),
                child: Icon(Icons.person_rounded, size: 20, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ercan Ant',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.textPrimary,
                      letterSpacing: .5,
                    ),
                  ),
                  Text(
                    'Zemheride Açan Nergisler',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
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
}
