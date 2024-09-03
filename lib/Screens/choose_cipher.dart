import 'package:flutter/material.dart';
import 'package:security_project/modules/chooseCondition.dart';

List<String> cipherList = [
  "Caesar Cipher",
  "PlayPhair cipher",
  "vigenere cipher",
  "RailFence cipher",
  "MonoAlphabetic cipher",
  "AutoKey cipher",
  "RowTransPosition cipher",
  "AES",
  "DES"
];

String? selectItem = "Caesar Cipher";

class chooseCipher extends StatefulWidget {
  const chooseCipher({Key? key}) : super(key: key);

  @override
  State<chooseCipher> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<chooseCipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose Type Of Cipher",
                    style: TextStyle(
                      color: Color.fromARGB(255, 193, 7, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  DropdownButton<String>(
                    value: selectItem,
                    items: cipherList
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 25),
                            )))
                        .toList(),
                    onChanged: (e) {
                      setState(() {
                        selectItem = e;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        conditionCipher(context, selectItem);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 214, 0, 196),
                      elevation: 6,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/1b059f26aa20412ea23704a6c7e1c5a1.png')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
