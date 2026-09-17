import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/home/domain/book.dart';

class BookDetailDialog extends StatelessWidget {
  const BookDetailDialog({
    super.key,
    required this.book,
    required this.onBuyPressed,
  });

  final Book book;
  final VoidCallback onBuyPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 950, maxHeight: 700),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final mobile = constraints.maxWidth < 700;

            if (mobile) {
              return _Mobile(book: book, onBuyPressed: onBuyPressed);
            }

            return _Desktop(book: book, onBuyPressed: onBuyPressed);
          },
        ),
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({required this.book, required this.onBuyPressed});

  final Book book;
  final VoidCallback onBuyPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: Image.asset(book.coverPath, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Roman",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  "Arka Kapak",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      book.longDescription,
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Kapat"),
                    ),
                    const SizedBox(width: 16),
                    FilledButton.icon(
                      onPressed: onBuyPressed,
                      icon: const Icon(Icons.shopping_bag_outlined),
                      label: const Text("Satın Al"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.book, required this.onBuyPressed});

  final Book book;
  final VoidCallback onBuyPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Image.asset(book.coverPath, fit: BoxFit.cover),
          ),

          const SizedBox(height: 24),

          Text(
            book.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Roman",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),

          const SizedBox(height: 24),

          Text("Arka Kapak", style: theme.textTheme.titleLarge),

          const SizedBox(height: 16),

          Text(
            book.longDescription,
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
          ),

          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onBuyPressed,
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text("Satın Al"),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kapat"),
            ),
          ),
        ],
      ),
    );
  }
}
