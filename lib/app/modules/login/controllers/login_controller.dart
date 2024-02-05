import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isHidden = true.obs;

  void showPassword() {
    isHidden.value = !isHidden.value;
  }

  void loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == true) {
            Get.offAllNamed(Routes.HOME);
            Get.snackbar('Success', 'User logged in successfully');
          } else {
            Get.defaultDialog(
              title: 'Email not verified',
              middleText:
                  'Please verify your email, Did not receive verification email?',
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    try{
                      await userCredential.user!.sendEmailVerification();
                      Get.snackbar('Success', 'Verification email sent');
                      Get.back();
                    }
                    catch(e){
                      print(e);
                      Get.snackbar('Error', e.toString());
                    }
                  },
                  child: Text('Resend verification email'),
                ),
              ],
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Error', 'No user found for that email.');
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar('Error', 'Wrong password provided for that user.');
          print('Wrong password provided for that user.');
        }
        else {
          Get.snackbar('Error', 'Wrong password provided for that user.');
        }
      }
    }
  }

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill email field');
    } else {
      try {
        await auth.sendPasswordResetEmail(email: emailController.text);
        Get.snackbar('Success', 'Password reset email sent');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Error', 'No user found for that email.');
          print('No user found for that email.');
        }
      }
    }
  }
}
