import 'package:flutter/material.dart';
import 'ui/game_screen.dart';

import 'logic/format.dart';
import 'logic/global.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextStyle thumbnailStyle =
      new TextStyle(fontSize: 20, fontWeight: FontWeight.w600, shadows: [
    Shadow(
        // bottomLeft
        offset: Offset(-1.5, -1.5),
        color: Colors.black),
    Shadow(
        // bottomRight
        offset: Offset(1.5, -1.5),
        color: Colors.black),
    Shadow(
        // topRight
        offset: Offset(1.5, 1.5),
        color: Colors.black),
    Shadow(
        // topLeft
        offset: Offset(-1.5, 1.5),
        color: Colors.black),
  ]);

  //MyGame game = MyGame();
  TextEditingController controller = new TextEditingController();


/*
  void initState() {
    super.initState();
    loadfrienddata().then((result) {
      // If we need to rebuild the widget with the resulting data,
      // make sure to use `setState`
      setState(() {

      });
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
          buttonColor: Colors.black),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:  gamecards.length ,
          itemBuilder: (context, index) {
            return cardview(gamecards[index]);
          },
        ),
      ),
    );
  }

  Widget cardview(Gamecard gamecard) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 60, 30, 40),
      child: InkWell(
          onTap: () {
            print("tapped!");
            Navigator.of(context).push(createRoute(FullGame(gamecard)));
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage('assets/images/pixel_background' +
                          gamecard.character.toString() +
                          '.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.transparent, width: 150),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 2.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      gamecard.name,
                      style: thumbnailStyle,
                    ),
                    Text(
                      (gamecard.cardSteps).toString() + " Steps",
                      style: thumbnailStyle,
                    )
                  ],
                ),
                right: 20,
                bottom: 20,
              )
            ],
          )),
    );
  }
}