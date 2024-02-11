class RegisterRequestModel {
  RegisterRequestModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
  });
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'role': role,
    };
    return data;
  }
}
