import 'dart:async';

import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_states.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/domain/parking_service.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/domain/employer_service.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/employer_model.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/parking_model.dart';

class ParkingBloc extends Cubit<ParkingStates> {
  ParkingBloc() : super(InitialParking());
  static List<EmployerModel> employers = [];
  static late ParkingModel parking;
  List<ParkingModel> parkings = [];
  // List<EmployerModel> allEmployers = [];
  Future getAvailableParking() async {
    try {
      emit(LoadingParking(progress: S.current.gettingParkingsData));
      await ParkingService().getAvailableParking().then((value) async {
        parkings = value;
        //  allEmployers = await EmployerRepo().getAllEmployers();
       // print(parkings.first.parkingName);
        
        emit(GetAvailableParking(availableParking: parkings));
      });
    } catch (error) {
      emit(ParkingFailed(error: error.toString()));
    }
  }

  Future addNewParking() async {
    try {
      emit(LoadingParking(
        progress: S.current.addingNewParking,
      ));
      List<String> employersIds = [];
      await ParkingService().addParking(parking).then((value) async {
//        print(value);
        parking = value;
    //    print("id from parking cubit ${parking.parkingId}");
  //      print(employers.length);
        for (int i = 0; i < employers.length; i++) {
          /* await FirebaseAuthService.signUp(
                  emailAddress: employers[i].email ?? "",
                  password: employers[i].password ?? "",
                /*   isEmployer: true */)
              .then((value) async {
            if (value is EmployerModel) { */
          employers[i] = EmployerModel(
              // uid: value.uid,
              name: employers[i].name,
              userName: employers[i].userName,
              imageUrl: "",
              password: employers[i].password,
              phoneNumber: employers[i].phoneNumber,
              parkingId: parking.parkingId,
              nationalId: employers[i].nationalId);
//          await FirebaseAuthService.sendEmailVerfication();
          await EmployerRepo()
              .saveEmployerData(employers[i])
              .then((value) async {
            employersIds.add(value.uid!);
          });
          /*  } else {
              
              emit(ParkingFailed(error: value.toString()));
            } 
          });*/
        }
        await ParkingService()
            .updataParkingData(
                parkingId: parking.parkingId!,
                field: "employers",
                data: employersIds)
            .then((value) {
          

          emit(ParkingAddded());
        }).catchError((error) {
          emit(ParkingFailed(error: error.toString()));
        });
      });
    } catch (e) {
      emit(ParkingFailed(error: e.toString()));
    }
  }

  Future editParkingInfromation(ParkingModel parkingModel) async {
    try {
      emit(LoadingParking(
        progress: S.current.edittingParking
      ));
  //    print("edit parking informations");

      await ParkingService()
          .updateData(
              parkingId: parkingModel.parkingId!,
              parkingName: parkingModel.parkingName!,
              capacity: parkingModel.capacity!,
              price: parkingModel.price!)
          .then((_) async {
        await ParkingService().getAvailableParking().then((value) {
          emit(GetAvailableParking(availableParking: value));
        });
    //    print("edit parking done");
      });
    } catch (error) {
      emit(ParkingFailed(error: error.toString()));
    }
  }

  Future editParking(ParkingModel parkingModel) async {
    try {
      emit(LoadingParking(
        progress: S.current.edittingParking
      ));
      List<String> employersIds = [];
      List<EmployerModel> employersData =
          AddEmployersCubit.employersOfSpecificParking;

    //  print("from edit park");
    //  print(parkingModel.parkingId);
      for (int i = 0; i < parkingModel.employerIds!.length; i++) {
      //  print("length: ${parkingModel.employerIds!.length}");
        await EmployerRepo().deleteEmployer(parkingModel.employerIds![i]);
      }
    //  print("after delete");
      await ParkingService()
          .updateData(
              parkingId: parkingModel.parkingId!,
              parkingName: parkingModel.parkingName!,
              capacity: parkingModel.capacity!,
              price: parkingModel.price!)
          .then((value) async {
    //    print("to");
    //    print(value);
        // parking = value;
    //    print("id from parking cubit ${parkingModel.parkingId}");
        // print(employers.length);
        for (int i = 0; i < employersData.length; i++) {
          /* await FirebaseAuthService.signUp(
                  emailAddress: employers[i].email ?? "",
                  password: employers[i].password ?? "",
                /*   isEmployer: true */)
              .then((value) async {
            if (value is EmployerModel) { */
          employersData[i] = EmployerModel(
              // uid: value.uid,
              name: employersData[i].name,
              userName: employersData[i].userName,
              imageUrl: "",
              password: employersData[i].password,
              phoneNumber: employersData[i].phoneNumber,
              parkingId: parkingModel.parkingId,
              nationalId: employersData[i].nationalId);
//          await FirebaseAuthService.sendEmailVerfication();
          await EmployerRepo()
              .saveEmployerData(employersData[i])
              .then((value) async {
            employersIds.add(value.uid!);
          });
          /*  } else {
              
              emit(ParkingFailed(error: value.toString()));
            } 
          });*/
        }
        await ParkingService()
            .updataParkingData(
                parkingId: parkingModel.parkingId!,
                field: "employers",
                data: employersIds)
            .then((value) {
          emit(ParkingAddded());
        }).catchError((error) {
          emit(ParkingFailed(error: error.toString()));
        });
      });
    } catch (e) {
      

      emit(ParkingFailed(error: e.toString()));
    }
  }

  Future deleteThisParking(String parkingId, List<String> employerIds) async {
    try {
      emit(LoadingParking(
        progress: S.current.deletingInProgress
      ));
      await ParkingService()
          .deleteParking(parkingId, employerIds)
          .then((value) async {
        await getAvailableParking();
      });
    } catch (error) {
      emit(ParkingFailed(error: error.toString()));
    }
  }
}
