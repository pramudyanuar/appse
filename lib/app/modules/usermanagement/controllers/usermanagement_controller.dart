import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsermanagementController extends GetxController {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('users').get();
      List<Map<String, dynamic>> usersData = [];
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        usersData.add(document.data() as Map<String, dynamic>);
      });
      return usersData;
    } catch (e) {
      print('Error getting all users: $e');
      return [];
    }
  }

}
