import 'package:newootd/flutter/material.dart';
import 'package:newootd/lib/utils/constants.dart';

class ColorPicker extends StatefulWidget {
  final ValueChanged<List<String>> onColorsSelected;
  final List<String>? initiallySelectedColors;

  const ColorPicker({
    super.key,
    required this.onColorsSelected,
    this.initiallySelectedColors,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late List<String> selectedColors;

  // Color mapping for visual representation
  final Map<String, Color> colorMap = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Black": Colors.black,
    "White": Colors.white,
    "Pink": Colors.pink,
    "Green": Colors.green,
    "Yellow": Colors.yellow,
    "Purple": Colors.purple,
    "Gray": Colors.grey,
  };

  @override
  void initState() {
    super.initState();
    selectedColors = widget.initiallySelectedColors ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Favorite Colors:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: AppConstants.colorOptions.map((color) {
            return FilterChip(
              label: Text(color),
              selected: selectedColors.contains(color),
              selectedColor: colorMap[color]?.withOpacity(0.3),
              backgroundColor: Colors.grey[200],
              checkmarkColor: colorMap[color],
              onSelected: (isSelected) {
                setState(() {
                  if (isSelected) {
                    selectedColors.add(color);
                  } else {
                    selectedColors.remove(color);
                  }
                  widget.onColorsSelected(selectedColors);
                });
              },
              avatar: CircleAvatar(
                backgroundColor: colorMap[color],
                radius: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: selectedColors.contains(color)
                      ? colorMap[color]!
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
        if (selectedColors.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            "Selected: ${selectedColors.join(", ")}",
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ],
    );
  }
}