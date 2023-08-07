
import 'file_model.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? token;
  FileModel? avatar;
  String? createdAt;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.token,
      this.avatar,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    token = json['token'];
    avatar = json['avatar'] != null ? FileModel.fromJson(json['avatar']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['token'] = token;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}
