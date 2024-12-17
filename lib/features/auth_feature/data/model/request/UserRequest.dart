class UserRequest {
  UserRequest({
    this.email,
    this.password,
    this.mobile,
    this.name,
    this.isAddHealthRecord = false,
  });

  UserRequest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    name = json['name'];
  }

  String? email;
  String? password;
  String? mobile;
  String? name;
  bool? isAddHealthRecord;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['mobile'] = mobile;
    map['name'] = name;
    return map;
  }
}
