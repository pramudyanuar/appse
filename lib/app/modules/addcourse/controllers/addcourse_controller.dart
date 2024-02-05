import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddcourseController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController imageLink = TextEditingController();
  TextEditingController totalMaterial = TextEditingController();

  void addCourse() {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('Class Added');

    if (title.text.isEmpty || imageLink.text.isEmpty || totalMaterial.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      try {
        firestore.collection('material').add({
          'title': title.text,
          'imageLink': imageLink.text,
          'totalMaterial': totalMaterial.text,
        });
        Get.snackbar('Success!', 'Course added successfully');
      } catch (e) {
        print(e);
      }
    }
  }
}
