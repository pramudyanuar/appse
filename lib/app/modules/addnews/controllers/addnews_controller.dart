import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddnewsController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController imageLink = TextEditingController();

  void addNews() {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('News Added');
    
    if (title.text.isEmpty || description.text.isEmpty || imageLink.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      try {
        firestore.collection('News').add({
          'Title': title.text,
          'Content': description.text,
          'ImageLink': imageLink.text,
        });
        Get.snackbar('Success!', 'News added successfully');
      } catch (e) {
        print(e);
      }
    }
  }
}
