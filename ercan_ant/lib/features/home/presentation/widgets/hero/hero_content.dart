import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 620),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: primary.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: primary.withValues(alpha: .15)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.auto_stories_rounded, size: 18, color: primary),
                  const SizedBox(width: 8),
                  Text(
                    "Yazar • Roman • Hikâye",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            Text(
              "ERCAN ANT",
              style: theme.textTheme.labelLarge?.copyWith(
                letterSpacing: 4,
                color: primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "Kelimelerin\nbıraktığı izleri\nkeşfedin.",
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.02,
              ),
            ),

            const SizedBox(height: 26),

            Container(
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: 560,
              child: Text(
                "Romanlar, hikâyeler ve denemeler... Her eser; umut, aidiyet, göç ve insanın iç dünyasına uzanan sessiz bir yolculuğun kapısını aralar.",
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.format_quote, color: primary, size: 32),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      "Her insan biraz gittiği yollar, biraz da geride bıraktıklarıdır.",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(220, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => context.go('/kitaplar'),
                  icon: const Icon(Icons.menu_book_rounded),
                  label: const Text("Kitapları İncele"),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(220, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => context.go('/blog'),
                  icon: const Icon(Icons.edit_note_rounded),
                  label: const Text("Yazarın Defteri"),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                _FeatureCard(
                  icon: Icons.auto_stories_outlined,
                  title: "Roman",
                  subtitle: "Edebi eserler",
                ),
                _FeatureCard(
                  icon: Icons.draw_outlined,
                  title: "Deneme",
                  subtitle: "Düşünce yazıları",
                ),
                _FeatureCard(
                  icon: Icons.library_books_outlined,
                  title: "Yeni Eserler",
                  subtitle: "Yakında",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Container(
      width: 175,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: primary.withValues(alpha: .08),
            child: Icon(icon, color: primary),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
