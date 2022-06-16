import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/saved_screen/saved_screen_controller.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/session_temp.dart';

class TripCardOptionsModalController extends GetxController {
  late RxBool isSaved;
  final bool isInSavedScreen;

  TripCardOptionsModalController({
    required this.isSaved,
    required this.isInSavedScreen,
  });

  Future<void> saveThisTrip({
    required FlightTicket flightTicket,
    required String flightTicketId,
  }) async {
    if (isSaved.value) {
      removeSaved(
        flightTickedId: flightTicketId,
      );
      if (isInSavedScreen) {
        final SavedScreenController savedScreenController = Get.find();
        savedScreenController.removeWithTripId(
          tripId: flightTicketId,
        );
      }
    } else {
      addSaved(
        flightTicket: flightTicket,
      );
    }
  }

  Future<void> removeSaved({
    required String flightTickedId,
  }) async {
    Get.dialog(LoadingDialog());
    await FirebaseFirestore.instance
        .collection('trips')
        .doc(flightTickedId)
        .update({
      'savedBy': FieldValue.arrayRemove(
        [
          userLoggedIn.uid,
        ],
      ),
    }).then((value) {
      FirebaseFirestore.instance
          .collection('saved')
          .doc(userLoggedIn.uid)
          .collection('trips')
          .doc(flightTickedId)
          .delete()
          .then((value) {
        isSaved.value = false;
        Get.back();
        Get.back();
      });
    });
  }

  Future<void> addSaved({
    required FlightTicket flightTicket,
  }) async {
    Get.dialog(LoadingDialog());
    await FirebaseFirestore.instance
        .collection('trips')
        .doc(flightTicket.id)
        .update({
      'savedBy': FieldValue.arrayUnion(
        [
          userLoggedIn.uid,
        ],
      ),
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection('saved')
          .doc(userLoggedIn.uid)
          .collection('trips')
          .doc(flightTicket.id)
          .set(
            flightTicket.toJson(),
          )
          .then((value) {
        isSaved.value = true;
        Get.back();
        Get.back();
      });
    });
  }
}
