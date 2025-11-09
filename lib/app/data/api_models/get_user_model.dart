class GetUserModel {
  bool? success;
  String? message;
  UserData? user;

  GetUserModel({this.success, this.message, this.user});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserData {
  String? sId;
  int? phone;
  var otp;
  String? name;
  String? profileimage;
  String? country;
  String? countryCode;
  String? description;
  List<String>? dreamPlace;
  List<String>? favoritePlace;
  List<String>? languages;
  List<SpaceQuestionAns>? spaceQuestionAns;
  List<String>? whatYouLove;
  String? yourPartner;
  List<Partners>? partners;

  UserData(
      {this.sId,
        this.phone,
        this.otp,
        this.name,
        this.profileimage,
        this.country,
        this.countryCode,
        this.description,
        this.dreamPlace,
        this.favoritePlace,
        this.languages,
        this.spaceQuestionAns,
        this.whatYouLove,
        this.yourPartner,
        this.partners});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    name = json['name'];
    profileimage = json['profileimage'];
    country = json['country'];
    countryCode = json['countryCode'];
    description = json['description'];
    dreamPlace = json['dreamPlace'].cast<String>();
    favoritePlace = json['favoritePlace'].cast<String>();
    languages = json['languages'].cast<String>();
    if (json['spaceQuestionAns'] != null) {
      spaceQuestionAns = <SpaceQuestionAns>[];
      json['spaceQuestionAns'].forEach((v) {
        spaceQuestionAns!.add(new SpaceQuestionAns.fromJson(v));
      });
    }
    whatYouLove = json['what_you_love'].cast<String>();
    yourPartner = json['your_partner'];
    if (json['partners'] != null) {
      partners = <Partners>[];
      json['partners'].forEach((v) {
        partners!.add(new Partners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['otp'] = otp;
    data['name'] = name;
    data['profileimage'] = profileimage;
    data['country'] = country;
    data['countryCode'] = countryCode;
    data['description'] = description;
    data['dreamPlace'] = dreamPlace;
    data['favoritePlace'] = favoritePlace;
    data['languages'] = languages;
    if (spaceQuestionAns != null) {
      data['spaceQuestionAns'] =
          spaceQuestionAns!.map((v) => v.toJson()).toList();
    }
    data['what_you_love'] = whatYouLove;
    data['your_partner'] = yourPartner;
    if (partners != null) {
      data['partners'] = partners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpaceQuestionAns {
  String? question;
  String? answer;
  String? sId;

  SpaceQuestionAns({this.question, this.answer, this.sId});

  SpaceQuestionAns.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['_id'] = sId;
    return data;
  }
}

class Partners {
  String? sId;
  String? addedBy;
  String? name;
  String? relation;
  String? description;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Partners(
      {this.sId,
        this.addedBy,
        this.name,
        this.relation,
        this.description,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Partners.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    addedBy = json['addedBy'];
    name = json['name'];
    relation = json['relation'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['addedBy'] = addedBy;
    data['name'] = name;
    data['relation'] = relation;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}


