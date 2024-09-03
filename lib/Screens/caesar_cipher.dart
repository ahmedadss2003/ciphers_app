//caeser cipher widget
import 'package:flutter/material.dart';
import 'package:security_project/Models/caesar_model.dart';

class CaesarCipher extends StatefulWidget {
  const CaesarCipher({Key? key}) : super(key: key);

  @override
  State<CaesarCipher> createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<CaesarCipher> {
  late TextEditingController plainTextController;
  late TextEditingController keyController;
  String cipherText = "";

  @override
  void initState() {
    super.initState();
    plainTextController = TextEditingController();
    keyController = TextEditingController();
    
  }

  @override
  void dispose() {
    plainTextController.dispose();
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        ),
      body: SingleChildScrollView(
        child: Container(
          
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60,),
                const Text(
                  " Caesar Cipher ",
                  style: TextStyle(
                    fontSize: 40 ,
                    fontWeight: FontWeight.w700
                  ),
                  ),
                const SizedBox(height: 50,),
                TextField(
                  style:const TextStyle(color: Colors.white), 
                  controller: plainTextController,
                  
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 95, 191, 188),
                    hintText: 'Enter Caesar Cipher.',
                    border: OutlineInputBorder(
                       borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: keyController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 95, 191, 188),
                    hintText: 'Enter Caesar Cipher Key.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  style:const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String plaintext = plainTextController.text;
                      int key = int.tryParse(keyController.text) ?? 0;
                      AllCaesars allCaesars = AllCaesars();
                      cipherText = allCaesars.caesarCipher(plaintext, key);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 214, 0, 78),
                    elevation: 6,
                  ),
                  child: const Text(
                    'Click To Display Cipher',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
               const SizedBox(height: 30,) ,
                Text(
                  "Cipher Text is : $cipherText" ,
                  style:const TextStyle(
                    color: Color.fromARGB(255, 121, 13, 6),
                    fontSize: 30 ,
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


