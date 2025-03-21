import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategorySelector({super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: ChoiceChip(
                label:
                    Text(category, style: TextStyle(color: selectedCategory == category ? Colors.white : Colors.black)),
                selected: selectedCategory == category,
                onSelected: (selected) {
                  onCategorySelected(category);
                },
                backgroundColor: Colors.transparent,
                selectedColor: Colors.black45,
              ),
            ),
          );
        },
      ),
    );
  }
}
