import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    yield* firestore.collection('users').doc(auth.currentUser!.uid).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> isOpen() async* {
    yield* firestore.collection('isOpen/VpKM3Vib6sa7gEwP6FXi/isOpen').snapshots();
  }
}
