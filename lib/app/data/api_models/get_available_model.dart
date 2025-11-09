class GetAvailableModel {
  bool? success;
  String? message;
  Data? data;

  GetAvailableModel({this.success, this.message, this.data});

  GetAvailableModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? l202412;

  Data({this.l202412});

  Data.fromJson(Map<String, dynamic> json) {
    l202412 = json['2024-12'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2024-12'] = this.l202412;
    return data;
  }
}
