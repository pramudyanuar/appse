import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    yield* firestore.collection('users').doc(auth.currentUser!.uid).snapshots();
  }

  void logOut() async {
    Get.defaultDialog(
      title: 'Log Out',
      middleText: 'Are you sure you want to log out?',
      textConfirm: 'Yes',
      textCancel: 'No',
      confirmTextColor: Colors.white,
      buttonColor: Colors.blue[900],
      onConfirm: () async {
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed(Routes.INTRO);
      },
    );
  }
}
