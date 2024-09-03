import 'dart:typed_data';

import 'package:pointycastle/export.dart';
import 'dart:convert';

// Function to perform DES encryption and return the encrypted text
String desEncrypt(String plainText, String key) {
  final encrypter = BlockCipher('DES'); // Create an instance of BlockCipher with 'DES' algorithm

  final keyParameter = KeyParameter(utf8.encode(key)); // Convert the key to bytes
  final params = ParametersWithIV(keyParameter, Uint8List(8)); // Set key parameters
  
  encrypter.init(true, params); // Initialize the cipher for encryption

  final paddedText = _padData(utf8.encode(plainText), 8); // Padding plaintext if necessary
  final encryptedBytes = encrypter.process(paddedText); // Encrypt the plaintext
  final encodedText = base64Encode(encryptedBytes); // Encode the encrypted bytes to base64
  
  return encodedText; // Return the encrypted text
}

// Function to pad data to a multiple of blockSize
Uint8List _padData(Uint8List data, int blockSize) {
  final padLength = blockSize - (data.length % blockSize);
  final paddedData = Uint8List(data.length + padLength);
  paddedData.setRange(0, data.length, data);
  return paddedData;
}
