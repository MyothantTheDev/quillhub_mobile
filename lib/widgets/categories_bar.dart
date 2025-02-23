import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/category_provider.dart';

class CategoriesBar extends ConsumerStatefulWidget {
  const CategoriesBar({super.key});

  @override
  _CategoriesBarState createState() => _CategoriesBarState();
}

class _CategoriesBarState extends ConsumerState<CategoriesBar> {

  final List<String> _categories = ['Trending', 'Science', 'Technology', 'Mystery', 'History', 'Mythology', 'Medical'];

  @override
  Widget build(BuildContext context) {

    final selectedCategory = ref.watch(categoryProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _categories.map(
          (category) {
          return TextButton(
            onPressed: () {
              ref.read(categoryProvider.notifier).update(category);
            },
            child: Text(
              category,
              style: TextStyle(
                color: selectedCategory == category ? Colors.white : Colors.grey,
                fontWeight: selectedCategory == category ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }
        ).toList(),
      ),
    );
  }
}
