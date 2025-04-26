import 'package:flutter/material.dart';
import 'package:ootd_app/models/outfit_model.dart';
import 'package:ootd_app/services/outfit_service.dart';
import 'package:ootd_app/widgets/outfit_card.dart';

class RecommendationsScreen extends StatelessWidget {
  final String bodyShape;
  final String favoriteColor;

  const RecommendationsScreen({
    super.key,
    required this.bodyShape,
    required this.favoriteColor,

  return allOutfits.where((outfit) {
    final matchesBodyShape = outfit.bodyShape == bodyShape;
    final matchesColor = outfit.preferredColors
        .any((color) => favoriteColors.contains(color));
    return matchesBodyShape && matchesColor;
  }).take(4).toList(); // Get top 4 matches
}
  // Mock outfit data (replace with Firestore data)
  List<Outfit> getRecommendedOutfits() {
    return [
      Outfit(
        id: "1",
        imageUrl: "assets/outfit1.jpg",
        tags: ["Casual", favoriteColor],
        bodyShape: bodyShape,
        preferredColor: favoriteColor,
      ),
      Outfit(
        id: "2",
        imageUrl: "assets/outfit2.jpg",
        tags: ["Formal", favoriteColor],
        bodyShape: bodyShape,
        preferredColor: favoriteColor,
      ),
      Outfit(
        id: "3",
        imageUrl: "assets/outfit3.jpg",
        tags: ["Party", favoriteColor],
        bodyShape: bodyShape,
        preferredColor: favoriteColor,
      ),
      Outfit(
        id: "4",
        imageUrl: "assets/outfit4.jpg",
        tags: ["Work", favoriteColor],
        bodyShape: bodyShape,
        preferredColor: favoriteColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final outfits = getRecommendedOutfits();
    
    return Scaffold(
      appBar: AppBar(title: const Text("Recommended Outfits")),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: outfits.length,
        itemBuilder: (context, index) {
          return OutfitCard(
            outfit: outfits[index],
            onSave: () => OutfitService.saveOutfit(outfits[index]),
            onShare: () => ShareService.shareOutfit(outfits[index]),
          );
        },
      ),
    );
  }
}