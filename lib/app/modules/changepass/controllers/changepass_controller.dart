import 'package:appse/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangepassController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  var isHidden = true.obs;

  void showPassword() {
    isHidden.value = !isHidden.value;
  }

  void changePassword() async {
    if (passwordController.text.isEmpty ||
        newpasswordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      if (newpasswordController.text != confirmpasswordController.text) {
        Get.snackbar('Error', 'Password does not match');
      } else {
        try {
          String user = auth.currentUser!.email!;
          await auth.signInWithEmailAndPassword(
              email: user, password: passwordController.text);
          await auth.currentUser!.updatePassword(newpasswordController.text);
          await auth.signOut();
          await auth.signInWithEmailAndPassword(
              email: user, password: newpasswordController.text);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'wrong-password') {
            Get.snackbar('Error', 'Wrong password provided');
          }
        } finally {
          Get.snackbar("Success", "Uodate password success");
        }
      }
    }
  }
}
