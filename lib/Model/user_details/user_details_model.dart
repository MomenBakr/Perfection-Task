class UserDetailsModel {
  UserDetailsModel({
    this.data,
    this.support,
  });

  UserDetailsModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    support =
        json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  Data? data;
  Support? support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    return map;
  }
}

class Support {
  Support({
    this.url,
    this.text,
  });

  Support.fromJson(dynamic json) {
    url = json['url'];
    text = json['text'];
  }
  String? url;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
  num? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;
    return map;
  }
}
