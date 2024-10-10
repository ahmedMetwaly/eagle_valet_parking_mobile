class IncomeOfDay {
  String? date;
  int?emptyParking;
  int?occupidParking;
  int?totalCustomersOfToday;
  int? income; //garage capacity * grage price
  IncomeOfDay({ this.date, this.income, this.emptyParking, this.occupidParking, this.totalCustomersOfToday});
  IncomeOfDay.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    emptyParking= json["emptyParking"];
    occupidParking= json["occupidParking"];
    totalCustomersOfToday= json["totalCustomersOfToday"];
    income = json["income"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["date"] = date;
    data["emptyParking"] = emptyParking;
    data["occupidParking"] = occupidParking;
    data["totalCustomersOfToday"] = totalCustomersOfToday;
    data["income"] = income;
    return data;
  }
}
