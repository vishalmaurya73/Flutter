import 'package:flutter/material.dart';

class Card_menu extends StatefulWidget {
  const Card_menu({Key? key}) : super(key: key);

  @override
  State<Card_menu> createState() => _Card_menuState();
}

class _Card_menuState extends State<Card_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card widget'),
      ),
      body: Container(
        height: 270,
        margin: EdgeInsets.symmetric(vertical: 90, horizontal: 30),
        child: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.greenAccent[100],
            child: SizedBox(
              width: 300,
              height: 650,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green[300],
                        radius: 118,
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.adobe.com/express/create/media_1b86b8ec8c7a16270de11f4ad6d7884d0b48cdbd9.jpeg?width=400&format=webply&optimize=medium'),
                          radius: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Vishal Maurya',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'This channel create content is very papular and tranding.Tech official is the begineer youtube channel. This channel create content is very papular and tranding.Tech official is the begineer youtube channel. This channel create content is very papular and tranding.Tech official is the begineer youtube channel. This channel create content is very papular and tranding. .Tech official is the begineer youtube channel. This channel create content is very papular and tranding.',
                        style: TextStyle(fontSize: 15, color: Colors.green),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => 'null',
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: const [
                                Icon(Icons.touch_app),
                                Text('visit')
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
