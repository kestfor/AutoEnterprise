import 'package:flutter/material.dart';

class BottomCategorySelector extends StatelessWidget {
  final List<String> categories;
  final Function(String) onTap;
  final String currentCategory;
  final Widget? label;

  const BottomCategorySelector(
      {Key? key, required this.categories, required this.onTap, required this.currentCategory, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: categories.map((c) {
                return ListTile(
                  title: Text(c),
                  onTap: () {
                    onTap(c);
                    Navigator.pop(context, c);
                  },
                );
              }).toList(),
            );
          },
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          label: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(currentCategory, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
