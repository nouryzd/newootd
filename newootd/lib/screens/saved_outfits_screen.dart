import 'package:flutter/material.dart';
import 'package:ootd_app/models/outfit_model.dart';
import 'package:ootd_app/widgets/outfit_card.dart';

class SavedOutfitsScreen extends StatelessWidget {
  final List<Outfit> savedOutfits;

  const SavedOutfitsScreen({super.key, required this.savedOutfits});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Outfits")),
      body: savedOutfits.isEmpty
          ? const Center(child: Text("No saved outfits yet"))
          : ListView.builder(
              itemCount: savedOutfits.length,
              itemBuilder: (context, index) {
                return OutfitCard(
                  outfit: savedOutfits[index],
                  onSave: null,
                  onShare: () => ShareService.shareOutfit(savedOutfits[index]),
                );
              },
            ),
    );
  }
}