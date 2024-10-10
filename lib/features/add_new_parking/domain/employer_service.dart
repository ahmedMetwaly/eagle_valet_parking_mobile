//import 'dart:io';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/domain/parking_service.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/employer_model.dart';

import '../controller/bloc/add_employers_bloc/employer_bloc.dart';

class EmployerRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<EmployerModel> saveEmployerData(EmployerModel employer) async {
    try {
      //print("user id :${user.uid}");
      EmployerModel employerModel = EmployerModel();
      await _firestore
          .collection('employers')
          .add(employer.toJson())
          .then((value) async {
        await updateEmployerData(userId: value.id, field: "uid", data: value.id)
            .then((_) {
      //    print(value.id);
          employerModel = EmployerModel(
              uid: value.id,
              userName: employer.userName,
              imageUrl: "",
              name: employer.name,
              password: employer.password,
              phoneNumber: employer.phoneNumber,
              parkingId: employer.parkingId,
              nationalId: employer.nationalId);
        });
      //  print("id from employer service " + value.id);
      });
      return employerModel;
    } catch (error) {
      // debug//print('Error saving user data: $error');
      throw Exception("Error while saving data to the database $error");
    }
  }

  Future<List<EmployerModel>> getAllEmployers() async {
    List<EmployerModel> employers = [];
    try {
      final documentSnapshot = await _firestore.collection('employers').get();
      documentSnapshot.docs.map((doc) {
        EmployerModel employerModel = EmployerModel.fromJson(doc.data());
        employers.add(employerModel);
      });
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Error getting user data: $error');
      ////print('Error getting user data: $error');
      //return {}; // Return empty map on error
    }
    return employers;
  }

  Future<EmployerModel> getEmployerData(String employerId) async {
    try {
      final documentSnapshot =
          await _firestore.collection('employers').doc(employerId).get();
      if (documentSnapshot.exists) {
        return EmployerModel.fromJson(documentSnapshot.data() ?? {});
      } else {
        return EmployerModel();
      }
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Error getting user data: $error');
      ////print('Error getting user data: $error');
      //return {}; // Return empty map on error
    }
  }

  Future updateEmployerData(
      {required String userId,
      required String field,
      required dynamic data}) async {
    //print("userId $userId");

    try {
    //  print("fire");
      await _firestore
          .collection("employers")
          .doc(userId)
          .update({field: data}).then((value) {
    //    print("done");
      }).catchError((error) {
        throw Exception('Failed to update employers data');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update user data');
    }
  }

  Future updateData(
      {required String employerId,
      required String name,
      required String userName,
      required String nationalId,
      required String phoneNumber,
      required String password}) async {
    //print("parkingId $parkingId");
    try {
   //   print("fire");
      await _firestore.collection('employers').doc(employerId).update({
        'name': name, // Field 1
        'userName': userName,
        'nationalId': nationalId, // Field 2
        'phoneNumber': phoneNumber, // Field 2
        'password': password // Field 2
        // Field 5 (update to server time)
      }).then((value) {
     //   print("done");
      }).catchError((error) {
        throw Exception('Failed to update parking data $error');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update parking data $error');
    }
  }

  Future setEmployerData(
      {required String userId, required dynamic data}) async {
    //print("userId $userId");

    try {
     // print("fire");
      await _firestore
          .collection("employers")
          .doc(userId)
          .set(data)
          .then((value) {
    //    print("done");
      }).catchError((error) {
        throw Exception('Failed to update employers data');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update user data');
    }
  }

  Future<List<EmployerModel>> getEmployersForSpecificParking(
      String parkingId) async {
    List<EmployerModel> employers = [];
    try {
     // print("begin");

      await _firestore
          .collection('employers')
          .where('parkingId', isEqualTo: parkingId)
          .get()
          .then((employersData) {
    //    print("got");
    //    print(employersData.docs.length);
        for (int i = 0; i < employersData.docs.length; i++) {
          EmployerModel employer =
              EmployerModel.fromJson(employersData.docs[i].data());
        //  print("Emplaoyer name : ${employer.name}");
          employers.add(employer);
        }
      });
      return employers;
    } catch (error) {
      throw Exception('Failed to get employers');
    }
  }

  Future deleteEmployerFromEmployersCollection(String employerId) async {
    try {
      await _firestore.collection("employers").doc(employerId).delete();
    } catch (error) {
      throw Exception('Failed to delete employer from employers collection');
    }
  }

  Future deleteEmployer(String id) async {
    try {
      List<String> employersId = [];
      await _firestore
          .collection("employers")
          .doc(id)
          .delete()
          .then((value) async {
      //  print("deleted from employers collection");
        AddEmployersCubit.employersOfSpecificParking
            .removeWhere((employer) => employer.uid! == id);
      //  print(AddEmployersCubit.employersOfSpecificParking.first.parkingId!);
        employersId = List.generate(
            AddEmployersCubit.employersOfSpecificParking.length, (index) {
          return AddEmployersCubit.employersOfSpecificParking[index].uid!;
        });
        await ParkingService().updataParkingData(
            parkingId:
                AddEmployersCubit.employersOfSpecificParking.first.parkingId!,
            field: "employers",
            data: employersId);
      //  print("Employer deleted");
      }).catchError((error) {
        throw Exception('Failed to delete employer');
      });
    } catch (error) {
      throw Exception('Failed to delete employer');
    }
  }
  /*  Future<String> uploadImage(
      {required String userId, required XFile image}) async {
    try {
      final storage = FirebaseStorage.instance;
      final imageName = '$userId.jpg';
      final reference = storage.ref().child('profile_pictures/$imageName');
      final uploadTask = reference.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      await updataUserData(userId: userId, field: "imageUrl", data: url);
      return url.toString();
    } catch (error) {
      //print("error yad");
      throw Exception("Faild to Upload Image");
    }
  }
 */

  /* Future deleteHistoryItem(String userID, List data) async {
    try {
      await _firestore.collection("users").doc(userID).set(
          {"history": data}).then((value) => debug//print("delete history item"));
    } catch (error) {
      throw Exception("Faild to delete history item");
    }
  } */
}
