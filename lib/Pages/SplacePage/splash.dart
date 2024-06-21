
import 'dart:async';
import 'package:books_hub/Pages/Homepage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AuthPage/AuthPage.dart';


final auth =FirebaseAuth.instance;

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
    if (auth.currentUser != null){
      Get.offAll(const HomePage());
    } else{
      Get.offAll(const AuthPage());

    }
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (BuildContext context) => const AuthPage()));
    });
  }
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SafeArea(
        child: Scaffold(

          body: Container(
            color: Theme.of(context).colorScheme.primary,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('Assets/Images/book logo.png'),

                  ),
                  SizedBox(height: 10,),
                  Text(
                    "BOOKS HUB",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  CircularProgressIndicator(),

                  SizedBox(height: 300),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Read Something New",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        fontFamily: 'font1',
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
