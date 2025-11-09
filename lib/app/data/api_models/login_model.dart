class UserModel {
  bool? success;
  String? message;
  User? user;
  String? token;

  UserModel({this.success, this.message, this.user, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  int? phone;
  String? otp;
  String? country;
  String? name;
  String? profileimage;
  String? updatedAt;

  User(
      {this.sId,
        this.phone,
        this.otp,
        this.country,
        this.name,
        this.profileimage,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    country = json['country'];
    name = json['name'];
    profileimage = json['profileimage'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['otp'] = otp;
    data['country'] = country;
    data['name'] = name;
    data['profileimage'] = profileimage;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
