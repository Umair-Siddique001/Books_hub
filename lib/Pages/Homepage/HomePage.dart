import 'package:books_hub/Controller/BookController.dart';
import 'package:books_hub/Pages/Homepage/Widgets/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/BookCard.dart';
import '../../Components/BookTile.dart';
import '../../Models/Data.dart';
import '../BookDetails/BookDetails.dart';
import 'Widgets/AppBar.dart';
import 'Widgets/CategoryWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    bookController.getUserBook();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const HomeAppBar(),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text(
                        "Hello ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      Text(
                        "Dear!",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Time to read book and enhance your knowledge",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: double.infinity,
                    child: SearchScreen(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Topics",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categoryData
                          .map(
                            (e) => CategoryWidget(
                          iconPath: e["icon"]!,
                          btnName: e["lebel"]!,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Trending",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                          () => Row(
                        children: bookController.bookData
                            .map(
                              (e) => BookCard(
                            title: e.title!,
                            coverUrl: e.coverUrl!,
                            ontap: () {
                              Get.to(BookDetails(book: e));
                            },
                          ),
                        )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Your Interests",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Obx(
                        () => Column(
                      children: bookController.bookData
                          .map(
                            (e) => BookTile(
                          ontap: () {
                            Get.to(BookDetails(book: e));
                          },
                          title: e.title!,
                          coverUrl: e.coverUrl!,
                          author: e.author!,
                          price: e.price!,
                          rating: e.rating!,
                          totalRating: 12,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
