import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditprofileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController nrp = TextEditingController();
  TextEditingController email = TextEditingController();

  FirebaseFirestore storage = FirebaseFirestore.instance;

  Future<void> updateProfile(String uid) async {
    if (name.text.isNotEmpty && nrp.text.isNotEmpty && email.text.isNotEmpty) {
      try {
        await storage.collection('users').doc(uid).update({
          'name': name.text,
        });
        Get.snackbar('Success', 'Profile updated successfully');
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    } else {
      Get.snackbar('Error', 'Please fill all the fields');
    }
  }
}