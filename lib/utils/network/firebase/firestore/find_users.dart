import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/session_temp.dart';

class FindUsers extends GetConnect {
  Future<QuerySnapshot> findUsersByUsername({
    required String username,
  }) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('userNameSearch', arrayContains: username)
        .get();
  }

  Future<void> inviteUser({
    required String uid,
  }) async {
    // try {
    //   FirebaseFirestore.instance
    //       .collection('invites')
    //       .doc(userLoggedIn.uid)
    //       .get();
    //   return await FirebaseFirestore.instance
    //       .collection('invites')
    //       .doc(userLoggedIn.uid)
    //       .update(
    //     {
    //       'invited': FieldValue.arrayUnion(
    //         [
    //           uid,
    //         ],
    //       ),
    //       'invitedBy': userLoggedIn.uid,
    //     },
    //   );
    // } catch (e) {
    return await FirebaseFirestore.instance
        .collection('invites')
        .doc(userLoggedIn.uid)
        .set(
      {
        'invited': [uid],
        'invitedBy': userLoggedIn.uid,
      },
    );
    // }
  }
}
