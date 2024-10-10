class UserModel {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  String? password;
  String? phoneNumber;
  UserModel(
      {this.uid,
      required this.name,
      required this.email,
      required this.imageUrl,
      required this.password,
      this.phoneNumber,
     });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json["password"];
    imageUrl = json["imageUrl"];
    phoneNumber = json["phoneNumber"];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uid"] = uid;
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["imageUrl"] = imageUrl;
    data["phoneNumber"] = phoneNumber;


    return data;
  }
}
