class GetBookingModel {
  bool? success;
  String? message;
  GetBookingData? data;

  GetBookingModel({this.success, this.message, this.data});

  GetBookingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? GetBookingData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetBookingData {
  String? houseId;
  List<BookingRequests>? bookingRequests;

  GetBookingData({this.houseId, this.bookingRequests});

  GetBookingData.fromJson(Map<String, dynamic> json) {
    houseId = json['houseId'];
    if (json['bookingRequests'] != null) {
      bookingRequests = <BookingRequests>[];
      json['bookingRequests'].forEach((v) {
        bookingRequests!.add(BookingRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['houseId'] = houseId;
    if (bookingRequests != null) {
      data['bookingRequests'] =
          bookingRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingRequests {
  String? status;
  User? user;
  String? lookingFor;
  bool? isAccepted;
  String? startDate;
  String? endDate;
  String? personalNote;
  String? sId;
  List<TravellingPartners>? travellingPartners;
  String? requestDate;
  House? house;

  BookingRequests(
      {this.status,
        this.user,
        this.lookingFor,
        this.isAccepted,
        this.startDate,
        this.endDate,
        this.personalNote,
        this.sId,
        this.travellingPartners,
        this.requestDate,
        this.house});

  BookingRequests.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    lookingFor = json['lookingFor'];
    isAccepted = json['isAccepted'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    personalNote = json['personalNote'];
    sId = json['_id'];
    if (json['travellingPartners'] != null) {
      travellingPartners = <TravellingPartners>[];
      json['travellingPartners'].forEach((v) {
        travellingPartners!.add(TravellingPartners.fromJson(v));
      });
    }
    requestDate = json['requestDate'];
    house = json['house'] != null ? House.fromJson(json['house']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['lookingFor'] = lookingFor;
    data['isAccepted'] = isAccepted;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['personalNote'] = personalNote;
    data['_id'] = sId;
    if (travellingPartners != null) {
      data['travellingPartners'] =
          travellingPartners!.map((v) => v.toJson()).toList();
    }
    data['requestDate'] = requestDate;
    if (house != null) {
      data['house'] = house!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  int? phone;
  String? name;
  String? profileimage;
  String? country;
  String? countryCode;

  User(
      {this.sId,
        this.phone,
        this.name,
        this.profileimage,
        this.country,
        this.countryCode});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    name = json['name'];
    profileimage = json['profileimage'];
    country = json['country'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['name'] = name;
    data['profileimage'] = profileimage;
    data['country'] = country;
    data['countryCode'] = countryCode;
    return data;
  }
}

class TravellingPartners {
  String? name;
  String? relation;
  String? imageUrl;
  String? sId;

  TravellingPartners({this.name, this.relation, this.imageUrl, this.sId});

  TravellingPartners.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    relation = json['relation'];
    imageUrl = json['imageUrl'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['relation'] = relation;
    data['imageUrl'] = imageUrl;
    data['_id'] = sId;
    return data;
  }
}

class House {
  String? sId;
  HouseOwner? houseOwner;
  List<String>? houseImagesUrls;
  String? city;

  House({this.sId, this.houseOwner, this.houseImagesUrls, this.city});

  House.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    houseOwner = json['house_owner'] != null
        ? HouseOwner.fromJson(json['house_owner'])
        : null;
    houseImagesUrls = json['house_images_urls'].cast<String>();
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (houseOwner != null) {
      data['house_owner'] = houseOwner!.toJson();
    }
    data['house_images_urls'] = houseImagesUrls;
    data['city'] = city;
    return data;
  }
}

class HouseOwner {
  String? sId;
  String? name;
  String? profileimage;
  String? country;

  HouseOwner({this.sId, this.name, this.profileimage, this.country});

  HouseOwner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profileimage = json['profileimage'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['profileimage'] = profileimage;
    data['country'] = country;
    return data;
  }
}

