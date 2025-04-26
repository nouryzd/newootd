import 'package:share_plus/share_plus.dart';

class ShareService {
  static void shareOutfit(Outfit outfit) {
    Share.share(
      "Check out this OOTD recommendation!\n\n"
      "Outfit details:\n"
      "• Body Shape: ${outfit.bodyShape}\n"
      "• Preferred Color: ${outfit.preferredColor}\n"
      "• Tags: ${outfit.tags.join(", ")}\n\n"
      "Download the OOTD app for more recommendations!",
    );
  }
}