import 'package:flutter/material.dart';

import 'package:ercan_ant/features/home/data/book_repository.dart';
import 'book_card.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final books = const BookRepository().getBooks();
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 90),
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1450),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 22),

              Text(
                "Kitaplar",
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: 760,
                child: Text(
                  "Yayınlanan ve hazırlık aşamasında olan eserleri keşfedin. Her kitap farklı bir hikâye, farklı bir yolculuk sunuyor.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                ),
              ),

              const SizedBox(height: 70),

              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 40,
                runSpacing: 50,
                children: books.map((book) => BookCard(book: book)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
