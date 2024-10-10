import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/parking_model.dart';

abstract class ParkingStates{}
class InitialParking extends ParkingStates{}
class LoadingParking extends ParkingStates{
  final String progress;

  LoadingParking({required this.progress});
}
class GetAvailableParking extends ParkingStates{
  final List<ParkingModel> availableParking;

  GetAvailableParking({required this.availableParking});
}
class ParkingAddded extends ParkingStates{}
class ParkingEdit extends ParkingStates{}
class ParkingFailed extends ParkingStates{
  final String error;

  ParkingFailed({required this.error});
}