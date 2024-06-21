import 'package:books_hub/Controller/BookController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final bookController = Get.put(BookController());

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search books',
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              String query = searchController.text.trim();
              if (query.isNotEmpty) {
                bookController.searchBooks(query);
              }
            },
          ),
        ),
      ),
    );
  }
}
