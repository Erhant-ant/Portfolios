import 'package:ercan_ant/features/home/domain/purchase_link.dart';

class Book {
  const Book({
    required this.title,
    required this.description,
    required this.longDescription,
    required this.coverPath,
    required this.isPublished,
    required this.purchaseLinks,
  });

  /// Kart üzerinde görünen kısa açıklama.
  final String description;

  /// Detay penceresinde gösterilen arka kapak yazısı.
  final String longDescription;

  final String title;
  final String coverPath;
  final bool isPublished;
  final List<PurchaseLink> purchaseLinks;
}
