import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/blog/data/blog_repository.dart';
import 'package:ercan_ant/features/blog/domain/blog_post.dart';
import 'package:ercan_ant/shared/layout/app_layout.dart';
import 'package:ercan_ant/shared/widgets/app_footer.dart';
import 'package:ercan_ant/shared/widgets/app_navbar.dart';
import 'widgets/blog_card.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = const BlogRepository().getPosts();
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const AppNavbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  _BlogHeader(theme: theme),

                  // Blog listesi
                  Container(
                    color: AppColors.backgroundSecondary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.giant,
                    ),
                    child: AppLayout(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1100),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final isWide = constraints.maxWidth > 700;
                                if (isWide) {
                                  return _DesktopGrid(posts: posts);
                                }
                                return _MobileList(posts: posts);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

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

class _BlogHeader extends StatelessWidget {
  const _BlogHeader({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffFCF8F1), Color(0xffF3ECE2)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
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
                    Icon(Icons.edit_note_rounded, size: 18, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      'Yazarın Defteri',
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
                'Düşünceler,\nNotlar ve Yazılar',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge?.copyWith(
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Edebiyat, hayat ve yaratıcılık üzerine düşünceler. Yazma sürecinin arka planı, okuma notları ve ilham veren anlara dair yazılar.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopGrid extends StatelessWidget {
  const _DesktopGrid({required this.posts});

  final List<BlogPost> posts;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 28,
      runSpacing: 28,
      children: posts.map((post) {
        return SizedBox(
          width: 490,
          child: BlogCard(
            post: post,
            onTap: () => context.go('/blog/${post.id}'),
          ),
        );
      }).toList(),
    );
  }
}

class _MobileList extends StatelessWidget {
  const _MobileList({required this.posts});

  final List<BlogPost> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: posts
          .map((post) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BlogCard(
                  post: post,
                  onTap: () => context.go('/blog/${post.id}'),
                ),
              ))
          .toList(),
    );
  }
}
