class UpdateMyHouseModel {
  String? sId;
  String? houseOwner;
  List<String>? houseImagesUrls;
  String? city;
  List<String>? rules;
  List<HouseImages>? houseImages;
  String? createdAt;
  String? updatedAt;
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

  UpdateMyHouseModel(
      {this.sId,
        this.houseOwner,
        this.houseImagesUrls,
        this.city,
        this.rules,
        this.houseImages,
        this.createdAt,
        this.updatedAt,
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

  UpdateMyHouseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    houseOwner = json['house_owner'];
    houseImagesUrls = json['house_images_urls'].cast<String>();
    city = json['city'];
    rules = json['rules'].cast<String>();
    if (json['house_images'] != null) {
      houseImages = <HouseImages>[];
      json['house_images'].forEach((v) {
        houseImages!.add(new HouseImages.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['house_owner'] = houseOwner;
    data['house_images_urls'] = houseImagesUrls;
    data['city'] = city;
    data['rules'] = rules;
    if (houseImages != null) {
      data['house_images'] = houseImages!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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

class HouseImages {
  String? path;
  String? contentType;
  String? sId;

  HouseImages({this.path, this.contentType, this.sId});

  HouseImages.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    contentType = json['contentType'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['contentType'] = contentType;
    data['_id'] = sId;
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
