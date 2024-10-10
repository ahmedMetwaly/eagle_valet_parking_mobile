import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/parking_model.dart';

import 'employer_service.dart';

class ParkingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ParkingModel>> getAvailableParking() async {
    try {
      List<ParkingModel> parkings = [];
      await _firestore.collection('parkings').get().then((value) {
        parkings =
            value.docs.map((e) => ParkingModel.fromJson(e.data())).toList();
      });
      return parkings;
    } catch (error) {
      throw Exception("error while getting parkings $error");
    }
  }

  Future<ParkingModel> addParking(ParkingModel parking) async {
    try {
      ParkingModel parkingModel = ParkingModel();
      await _firestore
          .collection("parkings")
          .add(parking.toJson())
          .then((value) async {
        await updataParkingData(
                parkingId: value.id, field: "parkingId", data: value.id)
            .then((_) {
        //  print(value.id);
          parkingModel = ParkingModel(
              parkingId: value.id,
              parkingName: parking.parkingName,
              capacity: parking.capacity,
              price: parking.price,
              employerIds: [],
              incomeOfDay: [],
              tickets: []);
        });
      //  print("id from parking service " + value.id);
      });
      return parkingModel;
    } catch (error) {
      throw Exception("error while adding parking $error");
    }
  }

  Future getParkingData(String parkingId) async {
    try {
      final documentSnapshot =
          await _firestore.collection('parkings').doc(parkingId).get();
      if (documentSnapshot.exists) {
        return ParkingModel.fromJson(documentSnapshot.data() ?? {});
      } else {
        return {}; // Return empty map if user doesn't exist
      }
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Error getting parking data: $error');
      ////print('Error getting user data: $error');
      //return {}; // Return empty map on error
    }
  }

  Future updataParkingData(
      {required String parkingId,
      required String field,
      required dynamic data}) async {
    //print("parkingId $parkingId");
    try {
    //  print("fire");
      await _firestore
          .collection("parkings")
          .doc(parkingId)
          .update({field: data}).then((value) {
    //    print("done");
      }).catchError((error) {
        throw Exception('Failed to update parking data $error');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update parking data $error');
    }
  }

  Future updateData({
    required String parkingId,
    required String parkingName,
    required int capacity,
    required int price,
  }) async {
    //print("parkingId $parkingId");
    try {
    //  print("fire");
      await _firestore.collection('parkings').doc(parkingId).update({
        'parkingName': parkingName, // Field 1
        'capacity': capacity,
        'price': price // Field 2
        // Field 5 (update to server time)
      }).then((value) {
    //    print("done");
      }).catchError((error) {
        throw Exception('Failed to update parking data $error');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update parking data $error');
    }
  }

  Future deleteParking(String parkingId, List<String> employerIds) async {
    try {
   //   print("deleting parking");
      await _firestore.collection("parkings").doc(parkingId).delete();
      for (int i = 0; i < employerIds.length; i++) {
        await EmployerRepo()
            .deleteEmployerFromEmployersCollection(employerIds[i]);
      }
    //  print("done");
    } catch (error) {
      throw Exception('Failed to delete parking data $error');
    }
  }
}
