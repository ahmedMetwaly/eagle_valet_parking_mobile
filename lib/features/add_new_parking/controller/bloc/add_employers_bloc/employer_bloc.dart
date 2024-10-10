import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/employer_model.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/employer_service.dart';
import '../../../domain/parking_service.dart';
import 'employer_states.dart';

class AddEmployersCubit extends Cubit<EmployerStates> {
  AddEmployersCubit() : super(InitialEmployer());
  static List<EmployerModel> employersOfSpecificParking = [];

  static List<List<TextEditingController>> employers = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]
  ];
  Future readEmployers(String parkingId) async {
    try {
      emit(EmployerLoading(progress: S.current.gettingEmployersData));
      employersOfSpecificParking =
          await EmployerRepo().getEmployersForSpecificParking(parkingId);
      emit(SuccessGetEmployers());
    } catch (error) {
      emit(FailedGetEmployers(error: error.toString()));
    }
  }

  void getInitial() {
    AddEmployersCubit.employers = [
      [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController()
      ]
    ];
    emit(InitialEmployer());
  }

  Future getEmployersWorkAtParking(String parkingId) async {
    try {
      emit(EmployerLoading(progress: S.current.gettingEmployersData));
      employersOfSpecificParking =
          await EmployerRepo().getEmployersForSpecificParking(parkingId);
      employers = List.generate(employersOfSpecificParking.length, (_) {
        return List.generate(5, (_) => TextEditingController());
      });
     // print(employersOfSpecificParking.last.name);
      for (int i = 0; i < employersOfSpecificParking.length; i++) {
        employers[i][0].text = employersOfSpecificParking[i].name!;
        employers[i][1].text = employersOfSpecificParking[i].userName!;
        employers[i][2].text = employersOfSpecificParking[i].nationalId!;
        employers[i][3].text = employersOfSpecificParking[i].phoneNumber!;
      //  print(employersOfSpecificParking[i].phoneNumber!);
        employers[i][4].text = employersOfSpecificParking[i].password!;
      }

      emit(SuccessGetEmployers());
    } catch (error) {
      emit(FailedGetEmployers(error: error.toString()));
    }
  }

  void addNewEmployerCubit() {
    employers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]);
    //  employersOfSpecificParking.add(EmployerModel());
    emit(EmployerAdded());
  }

  void deleteEmployerCubit({required int index}) {
    employers.removeAt(index);
    //  employersOfSpecificParking.removeAt(index);
    emit(DeleteEmployer());
  }

  Future addNewEmployers(String parkingId, List<EmployerModel> employersData,
      List<String> employersId) async {
    try {
      emit(EmployerLoading(progress: S.current.addingNewEmployers));
      List<String> employersIds = employersId;

     // print(employersData.length);
      for (int i = 0; i < employersData.length; i++) {
        employersData[i] = EmployerModel(
            // uid: value.uid,
            name: employersData[i].name,
            userName: employersData[i].userName,
            imageUrl: "",
            password: employersData[i].password,
            phoneNumber: employersData[i].phoneNumber,
            parkingId: parkingId,
            nationalId: employersData[i].nationalId);
//          await FirebaseAuthService.sendEmailVerfication();
        await EmployerRepo()
            .saveEmployerData(employersData[i])
            .then((value) async {
          employersIds.add(value.uid!);
        });
        /*  } else {
              emit(LoadedState());
              emit(ParkingFailed(error: value.toString()));
            } 
          });*/
      }
      await ParkingService()
          .updataParkingData(
              parkingId: parkingId, field: "employers", data: employersIds)
          .then((value) {
        emit(EmployerAdded());
      }).catchError((error) {
        emit(FailedGetEmployers(error: error.toString()));
      });
    } catch (e) {
      // emit(LoadedState());

      emit(FailedGetEmployers(error: e.toString()));
    }
  }

  Future updateEmployer(
      {required String parkingId,
      required String employerId,
      required String name,
      required String userName,
      required String nationalId,
      required String phoneNumber,
      required String password}) async {
    try {
      emit(EmployerLoading(progress: S.current.updatingDataInProgress));
      await EmployerRepo()
          .updateData(
              employerId: employerId,
              name: name,
              userName: userName,
              nationalId: nationalId,
              phoneNumber: phoneNumber,
              password: password)
          .then((_) async {
        await readEmployers(parkingId);
      });
    } catch (error) {
      emit(FailedGetEmployers(error: error.toString()));
    }
  }

  Future deleteEmployer(String employerId) async {
    try {
      emit(EmployerLoading(progress: S.current.deletingInProgress));
      await EmployerRepo().deleteEmployer(employerId).then((value) async {
        emit(SuccessGetEmployers());
      });
    } catch (error) {
      emit(FailedGetEmployers(error: error.toString()));
    }
  }
}
