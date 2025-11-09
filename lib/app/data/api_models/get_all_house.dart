
class AllHouseModel {
  bool? success;
  String? message;
  List<Houses>? houses;

  AllHouseModel({this.success, this.message, this.houses});

  AllHouseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['houses'] != null) {
      houses = <Houses>[];
      json['houses'].forEach((v) {
        houses!.add(new Houses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (houses != null) {
      data['houses'] = houses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Houses {
  String? sId;
  HouseOwner? houseOwner;
  List<String>? houseImagesUrls;
  String? city;
  List<String>? rules;
  int? iV;
  String? description;
  List<String>? features;
  List<String>? homeCare;
  List<String>? houseRules;
  String? lat;
  String? long;
  MoreAboutSpace? moreAboutSpace;
  NeighborhoodDetails? neighborhoodDetails;
  List<String>? relaxingFeatures;
  List<String>? safetyItems;
  String? sharingContext;
  List<SpaceQuestionAns>? spaceQuestionAns;
  List<String>? spaceStyle;
  String? specificInstructions;

  Houses(
      {this.sId,
        this.houseOwner,
        this.houseImagesUrls,
        this.city,
        this.rules,
        this.iV,
        this.description,
        this.features,
        this.homeCare,
        this.houseRules,
        this.lat,
        this.long,
        this.moreAboutSpace,
        this.neighborhoodDetails,
        this.relaxingFeatures,
        this.safetyItems,
        this.sharingContext,
        this.spaceQuestionAns,
        this.spaceStyle,
        this.specificInstructions});

  Houses.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    houseOwner = json['house_owner'] != null
        ? new HouseOwner.fromJson(json['house_owner'])
        : null;
    houseImagesUrls = json['house_images_urls'].cast<String>();
    city = json['city'];
    rules = json['rules'].cast<String>();
    iV = json['__v'];
    description = json['description'];
    features = json['features'].cast<String>();
    homeCare = json['homeCare'].cast<String>();
    houseRules = json['houseRules'].cast<String>();
    lat = json['lat'];
    long = json['long'];
    moreAboutSpace = json['more_about_space'] != null
        ? new MoreAboutSpace.fromJson(json['more_about_space'])
        : null;
    neighborhoodDetails = json['neighborhoodDetails'] != null
        ? new NeighborhoodDetails.fromJson(json['neighborhoodDetails'])
        : null;
    relaxingFeatures = json['relaxingFeatures'].cast<String>();
    safetyItems = json['safetyItems'].cast<String>();
    sharingContext = json['sharingContext'];
    if (json['spaceQuestionAns'] != null) {
      spaceQuestionAns = <SpaceQuestionAns>[];
      json['spaceQuestionAns'].forEach((v) {
        spaceQuestionAns!.add(new SpaceQuestionAns.fromJson(v));
      });
    }
    spaceStyle = json['spaceStyle'].cast<String>();
    specificInstructions = json['specificInstructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (houseOwner != null) {
      data['house_owner'] = houseOwner!.toJson();
    }
    data['house_images_urls'] = houseImagesUrls;
    data['city'] = city;
    data['rules'] = rules;
    data['__v'] = iV;
    data['description'] = description;
    data['features'] = features;
    data['homeCare'] = homeCare;
    data['houseRules'] = houseRules;
    data['lat'] = lat;
    data['long'] = long;
    if (moreAboutSpace != null) {
      data['more_about_space'] = moreAboutSpace!.toJson();
    }
    if (neighborhoodDetails != null) {
      data['neighborhoodDetails'] = neighborhoodDetails!.toJson();
    }
    data['relaxingFeatures'] = relaxingFeatures;
    data['safetyItems'] = safetyItems;
    data['sharingContext'] = sharingContext;
    if (spaceQuestionAns != null) {
      data['spaceQuestionAns'] =
          spaceQuestionAns!.map((v) => v.toJson()).toList();
    }
    data['spaceStyle'] = spaceStyle;
    data['specificInstructions'] = specificInstructions;
    return data;
  }
}

class HouseOwner {
  Image? image;
  String? sId;
  int? phone;
  var otp;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? name;
  String? profileimage;
  String? country;
  String? countryCode;

  HouseOwner(
      {this.image,
        this.sId,
        this.phone,
        this.otp,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.name,
        this.profileimage,
        this.country,
        this.countryCode});

  HouseOwner.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    name = json['name'];
    profileimage = json['profileimage'];
    country = json['country'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['_id'] = sId;
    data['phone'] = phone;
    data['otp'] = otp;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['name'] = name;
    data['profileimage'] = profileimage;
    data['country'] = country;
    data['countryCode'] = countryCode;
    return data;
  }
}

class Image {
  String? path;
  String? filename;

  Image({this.path, this.filename});

  Image.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['filename'] = filename;
    return data;
  }
}

class MoreAboutSpace {
  int? guests;
  int? bedrooms;
  int? bed;
  int? bathrooms;
  String? sId;

  MoreAboutSpace(
      {this.guests, this.bedrooms, this.bed, this.bathrooms, this.sId});

  MoreAboutSpace.fromJson(Map<String, dynamic> json) {
    guests = json['guests'];
    bedrooms = json['bedrooms'];
    bed = json['bed'];
    bathrooms = json['bathrooms'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guests'] = guests;
    data['bedrooms'] = bedrooms;
    data['bed'] = bed;
    data['bathrooms'] = bathrooms;
    data['_id'] = sId;
    return data;
  }
}

class NeighborhoodDetails {
  String? details;
  String? imageurl;
  String? videourl;
  String? sId;

  NeighborhoodDetails({this.details, this.imageurl, this.videourl, this.sId});

  NeighborhoodDetails.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    imageurl = json['imageurl'];
    videourl = json['videourl'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['details'] = details;
    data['imageurl'] = imageurl;
    data['videourl'] = videourl;
    data['_id'] = sId;
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

