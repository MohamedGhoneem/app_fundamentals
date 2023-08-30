import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:encrypt/encrypt.dart';

class AppEncryptor {
  static const plainText = 'Sensitive data to be encrypted';
  final key = Key.fromUtf8('key');
  final iv = IV.fromLength(16);
  late final encrypter; // Initialization vector (IV) for AES
  init() {
    encrypter = Encrypter(AES(key));
  }

  String? encryptData(data) {
    // Encrypt data
    final encryptedText = encrypter.encrypt(data, iv: iv);
    log('Encrypted text: ${encryptedText.base64}');
    return encryptedText;
  }

  String? decryptData(encryptedText) {
    // Decrypt data
    final decryptedText = encrypter.decrypt(encryptedText, iv: iv);
    log('Decrypted text: $decryptedText');
    return decryptedText;
  }

  encryptFile() {
    // Encrypt file
    final inputFile = File('path/to/input/file.txt');
    final outputFile = File('path/to/output/encrypted_file.txt');

    final inputBytes = inputFile.readAsBytesSync();
    final encryptedBytes = encrypter.encryptBytes(inputBytes, iv: iv).bytes;

    outputFile.writeAsBytesSync(encryptedBytes);
    log('File encrypted and saved.');
  }

  decryptFile(encryptedBytes) {
    // Decrypt file
    final decryptedBytes =
        encrypter.decryptBytes(Encrypted(encryptedBytes), iv: iv);
    const decryptedFilePath = 'path/to/output/decrypted_file.txt';

    final decryptedFile = File(decryptedFilePath);
    decryptedFile.writeAsBytesSync(decryptedBytes);
    log('File decrypted and saved at: $decryptedFilePath');
  }
}
