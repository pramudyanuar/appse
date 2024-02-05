import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddtrainingController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  void addTraining() {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('Class Added');

    if (title.text.isEmpty || description.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      try {
        firestore.collection('course').add({
          'titleCourse': title.text,
          'descCourse': description.text,
        });
        Get.snackbar('Success!', 'Training added successfully');
      } catch (e) {
        print(e);
      }
    }
  }
}
