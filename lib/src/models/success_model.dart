import 'dart:convert';

import 'package:rxdart_bloc/rxdart_bloc.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class SuccessModel<T> extends BaseModel<SuccessModel> {
  int? status;
  String? message;
  T? data;

  SuccessModel({this.status, this.message, this.data});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    return data;
  }

  @override
  SuccessModel fromJson(Map<String, dynamic>? json) {
    return SuccessModel.fromJson(json!);
  }

  @override
  SuccessModel decodingFromJson(String str) {
    // TODO: implement decodingFromJson
    return SuccessModel.fromJson(json.decode(str));
  }

  @override
  String encodingToJson() {
    // TODO: implement encodingToJson
    return json.encode(toJson());
  }
}
