import 'package:flutter/material.dart';

import '../persons/persons_screen.dart';

class SearchableList<T> extends StatefulWidget {
  final List<T> items;
  final void Function(T)? onItemSelected;
  final List<T> Function(String, List<T>) filterFunction;
  final Widget Function(List<T>, void Function(T)?) listOfCardBuilder;
  final List<String>? categories;
  final List<T> Function(String, List<T>)? categoryFilterFunction;

  const SearchableList(
      {Key? key,
      required this.items,
      this.onItemSelected,
      this.categories,
      required this.listOfCardBuilder,
      required this.filterFunction,
      this.categoryFilterFunction})
      : super(key: key);

  @override
  SearchableScreenState<T> createState() => SearchableScreenState<T>();
}

class SearchableScreenState<T> extends State<SearchableList<T>> {
  String searchQuery = '';
  String selectedCategory = 'All';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: updateSearchQuery,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<T> filteredItems = widget.filterFunction(searchQuery, widget.items);
    if (widget.categories != null && widget.categoryFilterFunction != null) {
      filteredItems = widget.categoryFilterFunction!(selectedCategory, filteredItems);
    }
    return Scaffold(
      body: Column(
        children: [
          searchWidget(),
          widget.categories != null
              ? CategorySelector(
                  categories: widget.categories!,
                  selectedCategory: selectedCategory,
                  onCategorySelected: updateCategory,
                )
              : const SizedBox(),
          widget.listOfCardBuilder(filteredItems, widget.onItemSelected),
        ],
      ),
    );
  }
}
