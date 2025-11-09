class MyHouseModel {
  bool? success;
  HouseDetails? houseDetails;

  MyHouseModel({this.success, this.houseDetails});

  MyHouseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    houseDetails = json['houseDetails'] != null
        ? HouseDetails.fromJson(json['houseDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (houseDetails != null) {
      data['houseDetails'] = houseDetails!.toJson();
    }
    return data;
  }
}

class HouseDetails {
  String? sId;
  String? houseOwner;
  List<String>? houseImagesUrls;
  String? city;
  String? country;
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

  HouseDetails(
      {this.sId,
        this.houseOwner,
        this.houseImagesUrls,
        this.city,
        this.country,
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

  HouseDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    houseOwner = json['house_owner'];
    houseImagesUrls = json['house_images_urls'].cast<String>();
    city = json['city'];
    country = json['country'];
    rules = json['rules'].cast<String>();
    iV = json['__v'];
    description = json['description'];
    features = json['features'].cast<String>();
    homeCare = json['homeCare'].cast<String>();
    houseRules = json['houseRules'].cast<String>();
    lat = json['lat'];
    long = json['long'];
    moreAboutSpace = json['more_about_space'] != null
        ? MoreAboutSpace.fromJson(json['more_about_space'])
        : null;
    neighborhoodDetails = json['neighborhoodDetails'] != null
        ? NeighborhoodDetails.fromJson(json['neighborhoodDetails'])
        : null;
    relaxingFeatures = json['relaxingFeatures'].cast<String>();
    safetyItems = json['safetyItems'].cast<String>();
    sharingContext = json['sharingContext'];
    if (json['spaceQuestionAns'] != null) {
      spaceQuestionAns = <SpaceQuestionAns>[];
      json['spaceQuestionAns'].forEach((v) {
        spaceQuestionAns!.add(SpaceQuestionAns.fromJson(v));
      });
    }
    spaceStyle = json['spaceStyle'].cast<String>();
    specificInstructions = json['specificInstructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['house_owner'] = houseOwner;
    data['house_images_urls'] = houseImagesUrls;
    data['city'] = city;
    data['country'] = country;
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
