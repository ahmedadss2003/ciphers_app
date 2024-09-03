import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:security_project/Screens/MyProfile.dart';
import 'package:security_project/Screens/choose_cipher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: _ProfileIcon()),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
           
            Positioned(
              bottom: 0,
              child: Image.asset("assets/images/main_bottom.png", width: 100),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Welcome To In ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    " Cipher App. ",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 30,
                  ),
                  SvgPicture.asset(
                    "assets/icons/chat.svg",
                    height: 350,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Color.fromARGB(255, 228, 3, 202),
                              size: 40,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const chooseCipher()),
                            ),
                          ),
                          const Text(
                            "Start",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.person),
      offset: const Offset(0, 40),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text('Profile'),
          value: 'profile',
        ),
      ],
      onSelected: (value) {
        if (value == 'profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfilePage1(),
            ),
          );
        }
      },
    );
  }
}

