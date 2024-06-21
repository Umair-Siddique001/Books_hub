import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyInputTextField extends StatefulWidget {
  const MyInputTextField({super.key});

  @override
  State<MyInputTextField> createState() => _MyInputTextFieldState();
}

class _MyInputTextFieldState extends State<MyInputTextField> {
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Books')
        .where('title', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          SvgPicture.asset("Assets/Icons/search.svg"),
          const SizedBox(width: 10),
          Row(
            children: [
              SvgPicture.asset("Assets/Icons/search.svg"),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search Here...",
                ),
                onChanged: (query) {
                  searchFromFirebase(query);
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResult[index]['title']),
                  subtitle: Text(searchResult[index]['author']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
