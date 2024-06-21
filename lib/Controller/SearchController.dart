import 'package:books_hub/Models/BookModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
class QueryController extends GetxController {
  static QueryController get instance => Get.find();

  RxList<BookModel> searchResult = <BookModel>[].obs;

  void searchFromFirebase(String query) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Books')
          .where('title', isEqualTo: query) // or use an appropriate query method
          .get();

      searchResult.value = result.docs.map((e) => BookModel.fromJson(e.data())).toList();
      if (kDebugMode) {
        print(searchResult);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching data: $e");
      }
    }
  }
}
