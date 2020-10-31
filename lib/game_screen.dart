import 'package:flutter/material.dart';
import 'package:walkerholic_sprite/box-game.dart';

import 'Home.dart';

class FullGame extends StatefulWidget {
  @override
  _FullGameState createState() => _FullGameState();
}

class _FullGameState extends State<FullGame> {
  TextStyle inGameStyle = new TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      shadows: [
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

  MyGame game = MyGame(catsize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        return Navigator.of(context).pop();
      },
      child: Stack(
        children: [
          WillPopScope(
              child: game.widget,
              onWillPop: () async {
                return false;
              }),
          Positioned(
            child: Text(
              "StationSoen",
              style: inGameStyle,
            ),
            left: 20,
            top: 40,
          ),
          Positioned(
            child: Text(
              (catsize.toInt() * 10).toString() + " Steps",
              style: inGameStyle,
            ),
            left: 20,
            top: 70,
          ),
        ],
      ),
    ));
  }
}

Route createRoute(Widget a) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => a,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}