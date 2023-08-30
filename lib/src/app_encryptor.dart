import 'dart:developer';
import 'package:encrypt/encrypt.dart';

class Encryptor {
  // static const plainText = 'Sensitive data to be encrypted';
  final _key = Key.fromUtf8('TWOPGHONEIMENCRY');
  final _iv = IV.fromLength(16);
  late final _encrypter; // Initialization vector (IV) for AES
  init() {
    _encrypter = Encrypter(AES(_key));
  }

  encryptData(data) {
    // Encrypt data
    final encryptedText = _encrypter.encrypt(data, iv: _iv);
    log('Encrypted text: ${encryptedText.base64}');
    return encryptedText;
  }

  decryptData(encryptedText) {
    // Decrypt data
    final decryptedText = _encrypter.decrypt(encryptedText, iv: _iv);
    log('Decrypted text: $decryptedText');
    return decryptedText;
  }

// encryptFile(File file) {
//   // Encrypt file
//   // final inputFile = File('path/to/input/file.txt');
//   String outPutFileName = file.path.split('/').last;
//   print('outPutFileName : $outPutFileName');
//   String outPutFilePath = file.path.replaceAll(outPutFileName, '');
//   print('outPutFilePath : $outPutFilePath');
//
//   String extension = outPutFileName.split('.').last;
//   print('outPutFileExtension : $extension');
//
//   outPutFileName = outPutFileName.replaceAll('.$extension', '');
//   outPutFileName = outPutFileName.replaceAll(
//       outPutFileName, '${outPutFileName}Encrypted.$extension');
//   print('new outPutFileName : $outPutFileName');
//
//   final outputFile = File('$outPutFilePath$outPutFileName');
//
//   final inputBytes = file.readAsBytesSync();
//   final encryptedBytes = _encrypter.encryptBytes(inputBytes, iv: _iv).bytes;
//
//   outputFile.writeAsBytesSync(encryptedBytes);
//   log('File encrypted and saved.');
// }
//
// decryptFile(encryptedBytes) {
//   // Decrypt file
//   final decryptedBytes =
//       _encrypter.decryptBytes(Encrypted(encryptedBytes), iv: _iv);
//   const decryptedFilePath = 'path/to/output/decrypted_file.txt';
//
//   final decryptedFile = File(decryptedFilePath);
//   decryptedFile.writeAsBytesSync(decryptedBytes);
//   log('File decrypted and saved at: $decryptedFilePath');
// }
}
