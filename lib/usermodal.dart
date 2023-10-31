class UserModel {
  late String id;
  late String fullname;
  late String email;
  UserModel({required this.email, required this.fullname, required this.id});

  ///map to object (deserialization)
  UserModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.fullname = map["fullname"];
    this.email = map["email"];
  }

  ///object to map (serialization)
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "fullname": this.fullname,
      "email": this.email,
    };
  }
}
