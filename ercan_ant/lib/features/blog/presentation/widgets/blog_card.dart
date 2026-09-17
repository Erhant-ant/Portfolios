import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/features/blog/domain/blog_post.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({super.key, required this.post, required this.onTap});

  final BlogPost post;
  final VoidCallback onTap;

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _hover = false;

  String _formatDate(DateTime date) {
    const months = [
      'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran',
      'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final post = widget.post;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: _hover ? AppColors.primary.withValues(alpha: .35) : AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _hover ? .08 : .04),
                blurRadius: _hover ? 30 : 14,
                offset: Offset(0, _hover ? 14 : 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategori etiketi
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.primary.withValues(alpha: .15)),
                ),
                child: Text(
                  post.category,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.primary,
                    fontSize: 11,
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Başlık
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: _hover ? AppColors.primary : AppColors.textPrimary,
                  height: 1.35,
                ),
                child: Text(post.title, maxLines: 2, overflow: TextOverflow.ellipsis),
              ),

              const SizedBox(height: 14),

              // Özet
              Text(
                post.excerpt,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.75,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 24),

              // Ayırıcı
              Container(height: 1, color: AppColors.border),

              const SizedBox(height: 18),

              // Alt bilgi: tarih + okuma süresi
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 6),
                  Text(
                    _formatDate(post.date),
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                  ),
                  const Spacer(),
                  Icon(Icons.schedule_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 6),
                  Text(
                    '${post.readingMinutes} dk okuma',
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                  ),

                  const SizedBox(width: 16),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    child: Row(
                      children: [
                        Text(
                          'Oku',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: AppColors.primary,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedSlide(
                          duration: const Duration(milliseconds: 220),
                          offset: Offset(_hover ? .2 : 0, 0),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
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
