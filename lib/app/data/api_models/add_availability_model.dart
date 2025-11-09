class AddAvailablityModel {
  bool? success;
  String? message;
  House? house;

  AddAvailablityModel({this.success, this.message, this.house});

  AddAvailablityModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    house = json['house'] != null ? new House.fromJson(json['house']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (house != null) {
      data['house'] = house!.toJson();
    }
    return data;
  }
}

class House {
  String? sId;
  String? houseOwner;
  List<String>? houseImagesUrls;
  String? city;
  List<String>? rules;
  List<HouseImages>? houseImages;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<AvaibilityDates>? avaibilityDates;
  List<Bookings>? bookings;
  String? description;

  String? lat;
  String? long;

  String? sharingContext;

  String? specificInstructions;

  House(
      {this.sId,
        this.houseOwner,
        this.houseImagesUrls,
        this.city,
        this.rules,
        this.houseImages,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.avaibilityDates,
        this.bookings,
        this.description,
        this.lat,
        this.long,
        this.sharingContext,

        this.specificInstructions});

  House.fromJson(Map<String, dynamic> json) {
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
    if (json['avaibilityDates'] != null) {
      avaibilityDates = <AvaibilityDates>[];
      json['avaibilityDates'].forEach((v) {
        avaibilityDates!.add(new AvaibilityDates.fromJson(v));
      });
    }
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
    description = json['description'];

    lat = json['lat'];
    long = json['long'];

    sharingContext = json['sharingContext'];

    specificInstructions = json['specificInstructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (avaibilityDates != null) {
      data['avaibilityDates'] =
          avaibilityDates!.map((v) => v.toJson()).toList();
    }
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;

    data['lat'] = lat;
    data['long'] = long;

    data['sharingContext'] = sharingContext;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = path;
    data['contentType'] = contentType;
    data['_id'] = sId;
    return data;
  }
}

class AvaibilityDates {
  String? startDate;
  String? endDate;
  String? sId;

  AvaibilityDates({this.startDate, this.endDate, this.sId});

  AvaibilityDates.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['_id'] = sId;
    return data;
  }
}

class Bookings {
  String? user;
  String? lookingFor;
  bool? isAccepted;
  String? startDate;
  String? endDate;
  String? personalNote;
  String? sId;

  Bookings(
      {this.user,
        this.lookingFor,
        this.isAccepted,
        this.startDate,
        this.endDate,
        this.personalNote,
        this.sId});

  Bookings.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    lookingFor = json['lookingFor'];
    isAccepted = json['isAccepted'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    personalNote = json['personalNote'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = user;
    data['lookingFor'] = lookingFor;
    data['isAccepted'] = isAccepted;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['personalNote'] = personalNote;
    data['_id'] = sId;
    return data;
  }
}
