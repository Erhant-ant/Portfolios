import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_shadows.dart';
import 'package:ercan_ant/features/home/domain/book.dart';
import 'package:ercan_ant/features/home/presentation/dialogs/book_detail_dialog.dart';
import 'package:ercan_ant/features/home/presentation/dialogs/purchase_dialog.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool _hover = false;

  void _showDetails() {
    showDialog(
      context: context,
      builder: (_) => BookDetailDialog(
        book: widget.book,
        onBuyPressed: () {
          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (_) => PurchaseDialog(book: widget.book),
          );
        },
      ),
    );
  }

  void _buy() {
    if (!widget.book.isPublished) return;

    showDialog(
      context: context,
      builder: (_) => PurchaseDialog(book: widget.book),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final book = widget.book;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: 300,
        transform: Matrix4.translationValues(0, _hover ? -10 : 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: _hover ? AppShadows.large : AppShadows.medium,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 3,
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 250),
                        scale: _hover ? 1.06 : 1,
                        child: Image.asset(book.coverPath, fit: BoxFit.cover),
                      ),
                    ),

                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _hover ? 1 : 0,
                      child: Container(
                        color: Colors.black.withValues(alpha: .28),
                      ),
                    ),

                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _hover ? 1 : 0,
                      child: const Center(
                        child: CircleAvatar(
                          radius: 32,
                          child: Icon(Icons.visibility_outlined, size: 30),
                        ),
                      ),
                    ),

                    if (!book.isPublished)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade700,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Yakında",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),

            Text(
              book.title,
              maxLines: 2,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              book.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showDetails,
                    icon: const Icon(Icons.menu_book_outlined),
                    label: const Text("Detay"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: FilledButton.icon(
                    onPressed: book.isPublished ? _buy : null,
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text("Satın Al"),
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
