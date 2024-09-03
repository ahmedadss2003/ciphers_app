import 'package:flutter/material.dart';
class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Ahmed Ashraf",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                        },
                        heroTag: 'follow',
                        elevation: 0,
                        label: const Text("Follow"),
                        icon: const Icon(Icons.person_add_alt_1),
                      ),

                      const SizedBox(width: 20.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'mesage',
                        elevation: 0,                      
                        label: const Text("Message"),
                        icon: const Icon(Icons.message_rounded),
                      ),
                    ],  
                  ),
                  
                  const SizedBox(height: 25),
                  const _ProfileInfoRow(),
                  const Divider(
                      thickness: 2, // thickness of the line
                      indent: 2, // empty space to the leading edge of divider.
                      endIndent: 20, // empty space to the trailing edge of the divider.
                      color: Colors.black, // The color to use when painting the line.
                      height: 20, // The divider's height extent.
                    ),
                   const Text(
                    "All Thanks For Eng:Essra 🫡🫡",
                    style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: FontWeight.bold
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

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Posts", 200),
    ProfileInfoItem("Followers", 100),
    ProfileInfoItem("Following", 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
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
                  colors: [Color.fromARGB(255, 175, 153, 150), Color.fromARGB(255, 0, 209, 241)]),
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
                            'assets/images/ahmed.jpg')),
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


