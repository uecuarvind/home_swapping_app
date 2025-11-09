class BookedDateModel {
  bool? success;
  String? message;
  List<String>? dates;

  BookedDateModel({this.success, this.message, this.dates});

  BookedDateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    dates = json['dates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['dates'] = dates;
    return data;
  }
}
