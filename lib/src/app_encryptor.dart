import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:encrypt/encrypt.dart';

void main() {
  const plainText = 'Sensitive data to be encrypted';
  final key = Key.fromUtf8('Your 256-bit AES encryption key');
  final iv = IV.fromLength(16); // Initialization vector (IV) for AES

  final encrypter = Encrypter(AES(key));

  // Encrypt data
  final encryptedText = encrypter.encrypt(plainText, iv: iv);
  log('Encrypted text: ${encryptedText.base64}');

  // Decrypt data
  final decryptedText = encrypter.decrypt(encryptedText, iv: iv);
  log('Decrypted text: $decryptedText');

  // Encrypt file
  final inputFile = File('path/to/input/file.txt');
  final outputFile = File('path/to/output/encrypted_file.txt');

  final inputBytes = inputFile.readAsBytesSync();
  final encryptedBytes = encrypter.encryptBytes(inputBytes, iv: iv).bytes;

  outputFile.writeAsBytesSync(encryptedBytes);
  log('File encrypted and saved.');

  // Decrypt file
  final decryptedBytes = encrypter.decryptBytes(Encrypted(encryptedBytes), iv: iv);
  const decryptedFilePath = 'path/to/output/decrypted_file.txt';

  final decryptedFile = File(decryptedFilePath);
  decryptedFile.writeAsBytesSync(decryptedBytes);
  log('File decrypted and saved at: $decryptedFilePath');
}