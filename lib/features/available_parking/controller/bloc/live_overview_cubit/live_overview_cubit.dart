import 'dart:async';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/parking_model.dart';
import 'package:eagle_valet_parking_mobile/features/auth/data/models/income_of_day/income_of_day.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/repos/transactions_repo.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentState {
  final ParkingModel? data;
  final double? totalIncome;
  final List<IncomeOfDay>? incoms;
  final bool loading;
  final String? errorMessage;

  DocumentState({
    this.data,
    this.totalIncome,
    this.incoms,
    this.loading = false,
    this.errorMessage,
  });
}

class LiveOverViewCubit extends Cubit<DocumentState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> _subscription;
  String? selectedMonth;
  ParkingModel parking = ParkingModel();
  List<IncomeOfDay> incoms = [];
  LiveOverViewCubit()
      : super(DocumentState(
            data: ParkingModel(), totalIncome: 0.0, loading: true));

  void listenToDocument(String documentPath) {
   // print(documentPath);
    _subscription = _firestore
        .collection("parkings")
        .doc(documentPath)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        parking = ParkingModel.fromJson(snapshot.data() ?? {});
     //   print(parking.parkingName);
        emit(DocumentState(
            data: parking,
            incoms: selectedMonth == null
                ? parking.incomeOfDay
                : TransactionsRepo()
                    .getInconmsOfMonth(parking.incomeOfDay!, selectedMonth!),
            totalIncome: selectedMonth == null
                ? TransactionsRepo()
                    .getAllTransaction(incomes: parking.incomeOfDay!)
                : TransactionsRepo()
                    .totalIncomsOfMonth(parking.incomeOfDay!, selectedMonth!),
            loading: false));
      } else {
        emit(DocumentState(
            data: ParkingModel(),
            totalIncome: 0.0,
            loading: false,
            errorMessage: S.current.document_does_not_exist));
      }
    }, onError: (error) {
      emit(DocumentState(
          data: ParkingModel(),
          totalIncome: 0.0,
          loading: false,
          errorMessage: error.toString()));
    });
  }

  void changeMonth(String month) {
    selectedMonth = month;
  //  print("selected month from $selectedMonth");

    incoms = [];
    emit(DocumentState(data: state.data, totalIncome: 0.0, loading: true));
    for (int i = 0; i < parking.incomeOfDay!.length; i++) {
      if (parking.incomeOfDay![i].date!.contains(month)) {
        incoms.add(parking.incomeOfDay![i]);
      }
    }
    if (incoms.isEmpty) {
      selectedMonth = null;
      emit(DocumentState(
          data: ParkingModel(),
          totalIncome: 0.0,
          loading: false,
          errorMessage: S.current.monthError));
    } else {
     // print(incoms);
      ParkingModel parkingr = ParkingModel(
          incomeOfDay: incoms,
          capacity: state.data!.capacity,
          employerIds: state.data!.employerIds,
          parkingId: state.data!.parkingId,
          price: state.data!.price,
          tickets: state.data!.tickets,
          parkingName: state.data!.parkingName);

      emit(DocumentState(
          data: parkingr,
          incoms: incoms,
          totalIncome:
              TransactionsRepo().totalIncomsOfMonth(incoms, selectedMonth!),
          loading: false));
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
