import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/blog/data/blog_repository.dart';
import 'package:ercan_ant/features/blog/domain/blog_post.dart';
import 'package:ercan_ant/shared/layout/app_layout.dart';

/// Ana sayfada blog yazılarının önizlemesini gösteren bölüm
class BlogTeaser extends StatelessWidget {
  const BlogTeaser({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = const BlogRepository().getPosts().take(3).toList();
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.huge, horizontal: 32),
      child: AppLayout(
        child: Column(
          children: [
            // Başlık
            Column(
              children: [
                Container(
                  width: 50,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Yazarın Defteri',
                  style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: 600,
                  child: Text(
                    'Edebiyat, yazma süreci ve hayat üzerine düşünceler.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Blog kartları
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 850;
                if (isWide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: posts
                        .asMap()
                        .entries
                        .map((e) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: e.key < posts.length - 1 ? 24 : 0),
                                child: _MiniPostCard(post: e.value, theme: theme),
                              ),
                            ))
                        .toList(),
                  );
                }
                return Column(
                  children: posts
                      .map((p) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _MiniPostCard(post: p, theme: theme),
                          ))
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 48),

            OutlinedButton.icon(
              onPressed: () => context.go('/blog'),
              icon: const Icon(Icons.edit_note_rounded, size: 20),
              label: const Text('Tüm Yazıları Gör'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(220, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniPostCard extends StatefulWidget {
  const _MiniPostCard({required this.post, required this.theme});
  final BlogPost post;
  final ThemeData theme;

  @override
  State<_MiniPostCard> createState() => _MiniPostCardState();
}

class _MiniPostCardState extends State<_MiniPostCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final theme = widget.theme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => context.go('/blog/${post.id}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.translationValues(0, _hover ? -5 : 0, 0),
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: _hover ? AppColors.background : AppColors.backgroundSecondary,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: _hover ? AppColors.primary.withValues(alpha: .3) : AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _hover ? .07 : .03),
                blurRadius: _hover ? 24 : 8,
                offset: Offset(0, _hover ? 10 : 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategori
              Text(
                post.category.toUpperCase(),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  fontSize: 10,
                  letterSpacing: 1.8,
                ),
              ),

              const SizedBox(height: 12),

              // Başlık
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: _hover ? AppColors.primary : AppColors.textPrimary,
                  height: 1.35,
                ),
                child: Text(post.title, maxLines: 2, overflow: TextOverflow.ellipsis),
              ),

              const SizedBox(height: 12),

              Text(
                post.excerpt,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Icon(Icons.schedule_outlined, size: 13, color: AppColors.textSecondary),
                  const SizedBox(width: 5),
                  Text(
                    '${post.readingMinutes} dk',
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                  ),
                  const Spacer(),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 200),
                    offset: Offset(_hover ? .2 : 0, 0),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
