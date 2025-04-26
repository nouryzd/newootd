import 'package:flutter/material.dart';
import 'package:newootd/lib/screens/recommendations_screen.dart';
import 'package: newootd/lib/widgets/color_picker.dart'; // Make sure to import the color picker

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String? _bodyShape;
  List<String> selectedColors = []; // Add this line to your state class

  final List<String> bodyShapes = ["Apple", "Pear", "Hourglass", "Rectangle"];

  void _navigateToRecommendations() {
    if (_bodyShape != null && selectedColors.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecommendationsScreen(
            bodyShape: _bodyShape!,
            favoriteColors: selectedColors, // Now passing list instead of single color
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select both body shape and at least one color"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Preferences")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Existing body shape dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Body Shape"),
              value: _bodyShape,
              items: bodyShapes.map((shape) {
                return DropdownMenuItem(
                  value: shape,
                  child: Text(shape),
                );
              }).toList(),
              onChanged: (value) => setState(() => _bodyShape = value),
            ),
            const SizedBox(height: 20),

            // Color Picker Widget - Paste this part
            ColorPicker(
              onColorsSelected: (colors) {
                setState(() {
                  selectedColors = colors;
                });
              },
            ),
            const SizedBox(height: 30),

            // Rest of your form
            ElevatedButton(
              onPressed: _navigateToRecommendations,
              child: const Text("Get Recommendations"),
            ),
          ],
        ),
      ),
    );
  }
}