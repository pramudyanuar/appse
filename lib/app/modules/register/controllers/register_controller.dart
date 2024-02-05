import 'package:appse/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController extends GetxController {
  TextEditingController nrpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isHidden = true.obs;

  void showPassword() {
    isHidden.value = !isHidden.value;
  }

  void registerUser() async {
    if (nrpController.text.isEmpty ||
        nameController.text.isEmpty ||
        emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text);
        Get.snackbar('Success!', 'User registered successfully, please verify your email then login.');
        if(userCredential.user != null){
          String uid = userCredential.user!.uid;
          firestore.collection('users').doc(uid).set({
            'nrp': nrpController.text,
            'name': nameController.text,
            'email': emailController.text,
            'uid': uid,
            'createdAt': DateTime.now().toIso8601String(),
            'role' : 'user'
          }); 

          await userCredential.user!.sendEmailVerification();
        }
        Get.offAllNamed(Routes.LOGIN);


      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
