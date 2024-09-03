//caeser cipher widget
import 'package:flutter/material.dart';
import 'package:security_project/Models/caesar_model.dart';

class RailFence extends StatefulWidget {
  const RailFence({Key? key}) : super(key: key);

  @override
  State<RailFence> createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<RailFence> {
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
      
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                " Rail Fence ",
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
                  fillColor: Color.fromARGB(162, 0, 168, 201),
                  hintText: 'Enter PlainText.',
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
                  fillColor: Color.fromARGB(162, 0, 168, 201),
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
                    cipherText = allCaesars.encryptRailFence(plaintext, key);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 214, 0, 196),
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
    );
  }
}


