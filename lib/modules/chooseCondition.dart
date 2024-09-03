import 'package:flutter/material.dart';
import 'package:security_project/Screens/AES.dart';
import 'package:security_project/Screens/Des.dart';
import 'package:security_project/Screens/Rail_Fence.dart';
import 'package:security_project/Screens/Row_transposition.dart';
import 'package:security_project/Screens/autokey.dart';
import 'package:security_project/Screens/caesar_cipher.dart';
import 'package:security_project/Screens/monoalphabetic.dart';
import 'package:security_project/Screens/playphair.dart';
import 'package:security_project/Screens/vigenere.dart';

List<String> cipherList = ["Caesar Cipher", "PlayPhair cipher", "vigenere cipher","RailFence cipher","MonoAlphabetic cipher" , "AutoKey cipher" , "RowTransPosition cipher"];


void conditionCipher (BuildContext context , txt){
 if (txt =="Caesar Cipher") {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const CaesarCipher()),
   );
 } 
 else if (txt == "PlayPhair cipher"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const PlayFairCipher()),
   );
 }
  else if (txt == "vigenere cipher"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const Vigenere()),
   );
 }
  else if (txt == "RailFence cipher"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const RailFence()),
   );
 }
  else if (txt == "MonoAlphabetic cipher"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const MonoAlphaBetic()),
   );
 }
  else if (txt == "AutoKey cipher"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const AutoKey()),
   );
 }
  else if (txt == "RowTransPosition cipher"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const RowTransposition()),
   );
 }
 else if (txt == "AES"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const AES()),
   );
 }
 else if (txt == "DES"){
   Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const DES()),
   );
 }
}