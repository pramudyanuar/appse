import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class ScanController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getStatus() {
    return _firestore.collection('status').snapshots();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getHistory() {
    return _firestore.collection('users').doc(_auth.currentUser!.uid).collection('presence').orderBy("date").snapshots();
  }

  void presence() async {
    print("absen rek");
    try {
      Position position = await _determinePosition();
      await getPresence(position);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> getPresence(Position position) async {
    String uid = _auth.currentUser!.uid;
    CollectionReference<Map<String, dynamic>> colRef =
        await _firestore.collection('users').doc(uid).collection('presence');

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    print(formattedDate);
    QuerySnapshot<Map<String, dynamic>> data = await colRef.get();
    if (data.docs.length == 0) {
      await colRef.doc(formattedDate).set({
        "date": formattedDate,
        "masuk": {
          "position": {
            "latitude": position.latitude,
            "longitude": position.longitude
          },
          "date": formattedDate,
        }
      });
      Get.snackbar("Success", 'You have been present, Enjoy your day at LABSE');
    } else {
      DocumentSnapshot<Map<String, dynamic>> today =
          await colRef.doc(formattedDate).get();
      if (today.exists) {
        Map<String, dynamic>? dataToday = today.data()!;
        if (dataToday['keluar'] != null) {
          Get.snackbar("Error",
              'You have been present and out, Enjoy your day at LABSE');
          return;
        } else {
          await colRef.doc(formattedDate).update({
            "date": formattedDate,
            "keluar": {
              "position": {
                "latitude": position.latitude,
                "longitude": position.longitude
              },
              "date": formattedDate,
            }
          });
          Get.snackbar("Success", 'You have been present out, Enjoy your day');
        }
      } else {
        await colRef.doc(formattedDate).set({
          "date": formattedDate,
          "masuk": {
            "position": {
              "latitude": position.latitude,
              "longitude": position.longitude
            },
            "date": formattedDate,
          }
        });
      }
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error',
          'Location permissions are permanently denied, we cannot request permissions.');
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get current position
    return await Geolocator.getCurrentPosition();
  }
}
