class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel(
      {required this.phoneNo,
      required this.email,
      required this.fullName,
       this.id,
      required this.password});

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNo,
      "Password": password
    };
  }
}
