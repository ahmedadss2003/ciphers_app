//caeser cipher widget
import 'package:flutter/material.dart';
import 'package:security_project/Models/caesar_model.dart';

class DES extends StatefulWidget {
  const DES({Key? key}) : super(key: key);

  @override
  State<DES> createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<DES> {
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
                  "DES cipher ",
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
                    hintText: 'Enter Cipher.',
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
                    hintText: 'Enter Cipher Key.',
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
                      String key = keyController.text;
                      AllCaesars allCaesars = AllCaesars();
                      cipherText = allCaesars.aesEncrypt(plaintext, key);
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


