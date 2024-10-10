class EmployerModel {
  String? uid;
  String? parkingId;
  String? name;
  String? userName;
  String? imageUrl;
  String? password;
  String? phoneNumber;
  String? nationalId;

  EmployerModel({
    this.uid,
     this.parkingId,
     this.name,
     this.userName,
     this.imageUrl,
     this.password,
    this.phoneNumber,
    this.nationalId
  });
  EmployerModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    parkingId = json['parkingId'];
    name = json['name'];
    userName = json['userName'];
    password = json["password"];
    imageUrl = json["imageUrl"];
    phoneNumber = json["phoneNumber"];
    nationalId = json["nationalId"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uid"] = uid;
    data["parkingId"] = parkingId;
    data["name"] = name;
    data["userName"] = userName;
    data["password"] = password;
    data["imageUrl"] = imageUrl;
    data["phoneNumber"] = phoneNumber;
    data["nationalId"] = nationalId;

    return data;
  }
}
