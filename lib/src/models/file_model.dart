
///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class FileModel {
  String? id;
  String? filePath;
  String? fileUrl;
  String? originalName;

  FileModel({this.id, this.filePath, this.fileUrl, this.originalName});

  FileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filePath = json['file_path'];
    fileUrl = json['file_url'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['file_path'] = filePath;
    data['file_url'] = fileUrl;
    data['original_name'] = originalName;
    return data;
  }
}