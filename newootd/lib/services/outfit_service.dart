import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ootd_app/models/outfit_model.dart';

class OutfitService {
  static final CollectionReference _outfitsCollection =
      FirebaseFirestore.instance.collection('outfits');

  static Future<void> saveOutfit(Outfit outfit) async {
    await _outfitsCollection.add({
      'imageUrl': outfit.imageUrl,
      'tags': outfit.tags,
      'bodyShape': outfit.bodyShape,
      'preferredColor': outfit.preferredColor,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Stream<List<Outfit>> getSavedOutfits() {
    return _outfitsCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Outfit(
          id: doc.id,
          imageUrl: doc['imageUrl'],
          tags: List<String>.from(doc['tags']),
          bodyShape: doc['bodyShape'],
          preferredColor: doc['preferredColor'],
        );
      }).toList();
    });
  }
}