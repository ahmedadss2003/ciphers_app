import 'dart:convert';
import 'package:crypto_dart/crypto_dart.dart';

class AllCaesars{
  String caesarCipher(String plaintext, int key) {
  String cipherText = '';
  for (int i = 0; i < plaintext.length; i++) {
    int charCode = plaintext.codeUnitAt(i);
    if (charCode >= 65 && charCode <= 90) {
      // Uppercase letters
      cipherText += String.fromCharCode((charCode - 65 + key) % 26 + 65);
    } else if (charCode >= 97 && charCode <= 122) {
      // Lowercase letters
      cipherText += String.fromCharCode((charCode - 97 + key) % 26 + 97);
    } else {
      // Non-alphabetic characters remain unchanged
      cipherText += plaintext[i];
    }
  }
  return cipherText;
}
  String encryptPlayfairCipher(String key, String plaintext) {
  // Remove spaces and make the plaintext uppercase
  plaintext = plaintext.replaceAll(' ', '').toLowerCase();
  
  // Generate the Playfair cipher matrix
  String playfairMatrix = generatePlayfairMatrix(key);
  
  String ciphertext = '';
  
  // Encrypt pairs of characters
  for (int i = 0; i < plaintext.length; i += 2) {
    String char1 = plaintext[i];
    String char2 = (i + 1 < plaintext.length) ? plaintext[i + 1] : 'x';
    
    // Find the positions of the characters in the Playfair matrix
    int index1 = playfairMatrix.indexOf(char1);
    int index2 = playfairMatrix.indexOf(char2);
    
    // Get the row and column of each character
    int row1 = index1 ~/ 5;
    int col1 = index1 % 5;
    int row2 = index2 ~/ 5;
    int col2 = index2 % 5;
    
    // If both characters are in the same row, replace them with the characters to their right (circularly)
    if (row1 == row2) {
      ciphertext += playfairMatrix[row1 * 5 + (col1 + 1) % 5];
      ciphertext += playfairMatrix[row2 * 5 + (col2 + 1) % 5];
    } 
    // If both characters are in the same column, replace them with the characters below them (circularly)
    else if (col1 == col2) {
      ciphertext += playfairMatrix[((row1 + 1) % 5) * 5 + col1];
      ciphertext += playfairMatrix[((row2 + 1) % 5) * 5 + col2];
    } 
    // Otherwise, form a rectangle and replace each character with the one at the opposite corner of the rectangle
    else {
      ciphertext += playfairMatrix[row1 * 5 + col2];
      ciphertext += playfairMatrix[row2 * 5 + col1];
    }
  }
  
  return ciphertext.toUpperCase();
}
  String generatePlayfairMatrix(String key) {
  // Remove spaces and make the key uppercase
  key = key.replaceAll(' ', '').toLowerCase();
  
  // Initialize the Playfair matrix with the key
  String playfairMatrix = key;
  
  // Add the remaining alphabet characters to the Playfair matrix
  for (int i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
    String char = String.fromCharCode(i);
    if (!playfairMatrix.contains(char) && char != 'q') {
      playfairMatrix += char;
    }
  }
  
  return playfairMatrix;
}

  String encryptVigenere(String plaintext, String key) {
  // Convert plaintext and key to uppercase
  plaintext = plaintext.toUpperCase();
  key = key.toUpperCase();

  // Generate the ciphertext
  String ciphertext = '';
  for (int i = 0; i < plaintext.length; i++) {
    int charCode = plaintext.codeUnitAt(i);
    if (charCode >= 65 && charCode <= 90) {
      int keyIndex = i % key.length;
      int shift = key.codeUnitAt(keyIndex) - 65;
      int encryptedCharCode = (charCode + shift - 65) % 26 + 65;
      ciphertext += String.fromCharCode(encryptedCharCode);
    } else {
      // If character is not a letter, keep it unchanged
      ciphertext += plaintext[i];
    }
  }
  return ciphertext;
}

  String encryptAutokey(String plaintext, String key) {
  // Convert plaintext and key to uppercase
  plaintext = plaintext.toUpperCase();
  key = key.toUpperCase();

  // Generate the ciphertext
  String ciphertext = '';
  int keyIndex = 0;
  for (int i = 0; i < plaintext.length; i++) {
    int charCode = plaintext.codeUnitAt(i);
    if (charCode >= 65 && charCode <= 90) {
      int shift = key.codeUnitAt(keyIndex) - 65;
      int encryptedCharCode = (charCode + shift - 65) % 26 + 65;
      ciphertext += String.fromCharCode(encryptedCharCode);
      key += String.fromCharCode(charCode); // Append plaintext character to key
      keyIndex++;
    } else {
      // If character is not a letter, keep it unchanged
      ciphertext += plaintext[i];
    }
  }
  return ciphertext;
}

  String encryptRailFence(String plaintext, int rails) {
  // Remove whitespace from plaintext and convert to uppercase
  plaintext = plaintext.replaceAll(' ', '').toUpperCase();

  // Initialize rail fence matrix
  List<List<String>> railMatrix = List.generate(rails, (index) => []);

  // Populate rail fence matrix with plaintext characters
  int row = 0;
  bool down = true;
  for (int i = 0; i < plaintext.length; i++) {
    railMatrix[row].add(plaintext[i]);
    if (down) {
      row++;
      if (row == rails - 1) {
        down = false;
      }
    } else {
      row--;
      if (row == 0) {
        down = true;
      }
    }
  }

  // Concatenate characters from rail fence matrix
  String ciphertext = '';
  for (int i = 0; i < rails; i++) {
    ciphertext += railMatrix[i].join('');
  }

  return ciphertext;
}

  String encryptMonoalphabetic(String plaintext, String plainAlphabet, String cipherAlphabet) {
  // Create a mapping for the encryption
  Map<String, String> encryptionMap = {};
  for (int i = 0; i < plainAlphabet.length; i++) {
    encryptionMap[plainAlphabet[i]] = cipherAlphabet[i];
  }

  // Convert plaintext to lowercase
  plaintext = plaintext.toLowerCase();

  // Encrypt the plaintext
  String ciphertext = "";
  for (int i = 0; i < plaintext.length; i++) {
    String char = plaintext[i];
    if (encryptionMap.containsKey(char)) {
      ciphertext += encryptionMap[char]!;
    } else {
      // If character is not in the mapping, keep it unchanged
      ciphertext += char;
    }
  }
  return ciphertext;
}

  String encryptRowTransposition(String plainText, String key) {
  // Remove spaces and convert to uppercase for simplicity
  plainText = plainText.replaceAll(' ', '').toUpperCase();

  // Get the key length
  final keyLength = key.length;

  // Create a list to store the transposed characters
  final transposedChars = List.generate(keyLength, (_) => '');

  // Loop through each character of the plaintext
  for (int i = 0; i < plainText.length; i++) {
    // Get the current column index based on the key order
    final columnIndex = (key.codeUnitAt(i % keyLength) - 49) % keyLength; // Adjust for ASCII offset and modulo for key length

    // Add the character to the corresponding column
    transposedChars[columnIndex] += plainText[i];
  }

  // Combine the transposed characters into the ciphertext
  return transposedChars.join('');
}
  

// Function to perform AES encryption and return the encrypted text
// Function to perform AES encryption and return the encrypted text
String aesEncrypt(String plainText, String key) {
  final encryptedText = CryptoDart.AES.encrypt(plainText, key);
  final encodedText = base64Encode(utf8.encode(encryptedText.toString()));
  return encodedText;
}


}