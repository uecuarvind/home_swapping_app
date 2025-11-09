class ChatMessageModel {
  String? sId;
  String? text;
  String? imageUrl;
  String? videoUrl;
  bool? seen;
  String? msgByUserId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ChatMessageModel(
      {this.sId,
        this.text,
        this.imageUrl,
        this.videoUrl,
        this.seen,
        this.msgByUserId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ChatMessageModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    seen = json['seen'];
    msgByUserId = json['msgByUserId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['text'] = this.text;
    data['imageUrl'] = this.imageUrl;
    data['videoUrl'] = this.videoUrl;
    data['seen'] = this.seen;
    data['msgByUserId'] = this.msgByUserId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

