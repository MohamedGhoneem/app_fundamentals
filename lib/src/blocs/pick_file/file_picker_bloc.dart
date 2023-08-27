import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:app_core/app_core.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
enum FilePickerType { camera, gallery, file, scan }

class FilePickerBloc {
  // BehaviorSubject<File> fileSubject = BehaviorSubject();
  // File? file;
  // String? filePath;
  // String? fileName;
  // num? fileSize;
  FilePickerType type = FilePickerType.file;
  String pickedPhotoPath = '';

  Future<File?> pickFile() async {
    var device = DeviceInfoPlugin();
    final androidInfo = await device.androidInfo;

    debugPrint(
        'androidInfo.version.sdkInt.toString() : ${androidInfo.version.sdkInt.toString()}');
    switch (type) {
      case FilePickerType.camera:
        // TODO: Handle this case.
        var status = await Permission.camera.status;

        if (status.isGranted) {
          final ImagePicker _picker = ImagePicker();
          final XFile? photo =
              await _picker.pickImage(source: ImageSource.camera);
          return File(photo!.path);
        } else {
          Permission.camera.request();
        }
        break;
      case FilePickerType.gallery:
        // TODO: Handle this case.
        if (Platform.isAndroid && androidInfo.version.sdkInt >= 32) {
          const MethodChannel shareMethodChannel =
          MethodChannel('photo_picker_method_channel');
          String? result;
          try {
            result = await shareMethodChannel
                .invokeMethod('pickMedia', <String, String>{'file_type': "image"});

            // if (kDebugMode) {
            print('picked photo path: $result');
            // }

            return File(result ?? '');
          } on PlatformException catch (e) {
            result = e.message;
          }
        } else {
          if (await Permission.storage.isGranted) {
            final ImagePicker _picker = ImagePicker();
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.gallery);
            return File(photo!.path);
          } else {
            Permission.storage.request().then((value) => pickFile());
          }
        }
        break;
      case FilePickerType.file:
        // TODO: Handle this case.
        if (await Permission.storage.isGranted) {
          // FilePickerResult? result = await FilePicker.platform.pickFiles(
          //   type: FileType.custom,
          //   allowedExtensions: ['jpg', 'png', 'pdf'],
          // );
          // if (result != null) {
          //   List<dynamic> files =
          //       result.paths.map((path) => File(path!)).toList();
          //   log('files ${files.first.path.toString()}');
          //   log('files ${files.first.path.toString().split('/').last}');
          //   return files.first;
          // } else {
          //   // User canceled the picker
          // }
        } else {
          Permission.storage.request().then((value) => pickFile());
        }
        break;

      case FilePickerType.scan:
        // TODO: Handle this case.

        String? imagePath;
        // Platform messages may fail, so we use a try/catch PlatformException.
        // We also handle the message potentially returning null.
        try {
          // imagePath = (await EdgeDetection.detectEdge);
          // log("$imagePath");
          return File(imagePath!);
        } on PlatformException catch (e) {
          imagePath = e.toString();
          return null;
        }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.

      // break;
    }

    return File('');
  }

}
