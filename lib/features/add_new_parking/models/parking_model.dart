import '../../auth/data/models/income_of_day/income_of_day.dart';
import 'ticket.dart';

class ParkingModel {
  String? parkingId;
  String? parkingName;
  int? capacity;
  int? price;
  List<String>? employerIds;
  List<TicketModel>? tickets;
  List<IncomeOfDay>? incomeOfDay;
 
  ParkingModel({
    this.parkingId,
    this.parkingName,
    this.capacity,
    this.price,
    this.employerIds,
    this.tickets,
    this.incomeOfDay,
    
  });

  ParkingModel.fromJson(Map<String, dynamic> json) {
    parkingId = json["parkingId"];
    //print("parkingId $parkingId");
    parkingName = json["parkingName"];
    //print("parkingName $parkingName");
    capacity = json["capacity"];
    //print("capacity $capacity");
    price = json["price"];
    //print("price $price");


    //print("emptyParking $emptyParking");

    employerIds = json["employers"].cast<String>();

    //print("employerIds $employerIds");

    tickets = json["tickets"]
        .map<TicketModel>((e) => TicketModel.fromJson(e))
        .toList();

    //print("tickets $tickets");

    incomeOfDay = json["incomeOfDay"]
        .map<IncomeOfDay>((e) => IncomeOfDay.fromJson(e))
        .toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["parkingId"] = parkingId;
    data["parkingName"] = parkingName;
    data["capacity"] = capacity;
    data["price"] = price;

    if (employerIds != null) {
      data['employers'] = employerIds!.map((v) => v).toList();
    }
    if (tickets != null) {
      data['tickets'] = tickets!.map((v) => v).toList();
    }
    if (incomeOfDay != null) {
      data['incomeOfDay'] = incomeOfDay!.map((v) => v).toList();
    }

    return data;
  }
}
