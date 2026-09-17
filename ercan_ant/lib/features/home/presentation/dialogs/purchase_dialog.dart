import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/home/domain/book.dart';
import 'package:ercan_ant/features/home/domain/purchase_link.dart';

class PurchaseDialog extends StatelessWidget {
  const PurchaseDialog({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.menu_book_rounded, size: 48),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Nereden satın almak istersiniz?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                book.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.xl),

              ...book.purchaseLinks.map(
                (link) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _StoreCard(link: link),
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kapat'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreCard extends StatefulWidget {
  const _StoreCard({required this.link});

  final PurchaseLink link;

  @override
  State<_StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<_StoreCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: _hover
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
          ),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                    color: Colors.black.withValues(alpha: .08),
                  ),
                ]
              : [],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          onTap: () => _open(widget.link),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                const Icon(Icons.storefront_outlined),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    widget.link.storeName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),

                AnimatedSlide(
                  duration: const Duration(milliseconds: 180),
                  offset: _hover ? Offset.zero : const Offset(-0.2, 0),
                  child: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _open(PurchaseLink link) async {
    final uri = Uri.parse(link.url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
