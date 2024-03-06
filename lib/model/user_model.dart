class UserModel {
  String? username;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? password;
  String? profilePic;
  String? coverPic;
  String? bio;
  String? uId;
  bool? isEmailVerified;

  UserModel({
    this.username,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.profilePic,
    this.coverPic,
    this.bio,
    this.uId,
    this.isEmailVerified,
  });

  UserModel.fromFirebase(Map<String, dynamic>? response) {
    username = response?["username"] ?? "";
    email = response?["email"] ?? "";
    phone = response?["phone"] ?? "";
    dateOfBirth = response?["dateOfBirth"] ?? "";
    profilePic = response?["profilePic"] ?? "";
    coverPic = response?["coverPic"] ?? "";
    bio = response?["bio"] ?? "";
    uId = response?["uId"] ?? "";
    isEmailVerified = response?["isEmailVerified"] ?? "";
  }

  Map<String, dynamic> toFirebase() {
    return {
      "username": username,
      "email": email,
      "phone": phone,
      "dateOfBirth": dateOfBirth,
      "profilePic": profilePic,
      "coverPic": coverPic,
      "bio": bio,
      "uId": uId,
      "isEmailVerified": isEmailVerified,
    };
  }
}
