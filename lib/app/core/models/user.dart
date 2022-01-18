class User {
  late int? id;
  late int userType;
  late String? fullName;
  late String? email;
  late String? mobileNumber;

  User(
      {required this.id,
      required this.userType,
      required this.fullName,
      required this.email,
      required this.mobileNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    mobileNumber = json['mobileNumber'] ?? "";
    userType = json['userType'] ?? 1;
    fullName = json['fullName'] ?? "";
    email = json['email'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userType'] = userType;
    data['fullName'] = fullName;
    data['email'] = email;
    data['id'] = id;
    data['mobileNumber'] = mobileNumber;
    return data;
  }
}
