
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/AuthController.dart';
import 'AuthPage.dart';
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ForgetpasswordController = TextEditingController();
    AuthController authController = Get.put(AuthController());
final _email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your email id and we will send you reset password link on email",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: ForgetpasswordController,
              decoration: InputDecoration(
                hintText: "Enter Email id",
                fillColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              var forgotEmail = ForgetpasswordController.text.trim();

              try {
                await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmail)
                    .then((value) => {
                      print("Email Sent!"),
                  Get.off(() => AuthPage()),
                });}
                   catch(e){
                print("Error $e");
                  }

            }, child: Text("Reset Now")),
          ],
        ),
      ),
    );
  }
}
