import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminpanelController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxBool status = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the status value from Firebase
    initializeStatus();
  }

  void initializeStatus() async {
    try {
      var statusDoc = await firestore
          .collection('status')
          .doc('rhRoUM16Hf7a6fFnypl0')
          .get();

      if (statusDoc.exists) {
        // Update the status value with the value from Firebase
        status.value = statusDoc['IsOpen'];
      }
    } catch (e) {
      // Handle error, if any
      print('Error initializing status: $e');
    }
  }

  void updateStatus(bool value) async {
    status.value = value;

    try {
      await firestore
          .collection('status')
          .doc('rhRoUM16Hf7a6fFnypl0')
          .update({'IsOpen': value});
    } catch (e) {
      // Handle error, if any
      print('Error updating status: $e');
    }
  }
}
