import 'package:flutter/material.dart';
import 'package:ootd_app/models/outfit_model.dart';

class OutfitCard extends StatelessWidget {
  final Outfit outfit;
  final VoidCallback? onSave;
  final VoidCallback onShare;

  const OutfitCard({
    super.key,
    required this.outfit,
    this.onSave,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              outfit.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tags: ${outfit.tags.join(", ")}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (onSave != null)
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: onSave,
                      ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: onShare,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}