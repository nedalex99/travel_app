import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TripsCollection extends GetConnect {
  Future<QuerySnapshot> getTrips() async {
    return FirebaseFirestore.instance.collection('trips').get();
  }
}
