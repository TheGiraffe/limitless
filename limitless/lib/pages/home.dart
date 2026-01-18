import 'package:Limitless/pages/settings.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../uicomponents/drawer.dart';
import '../uicomponents/options.dart';
import '../types.dart';
import '../components/planet.dart';
import 'dart:math';
import 'maingame.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.userInfo});

  final String title;
  final dynamic userInfo;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      drawer: MyDrawerWidget(userInfo: widget.userInfo),
      body: GameWidget(game: MainGame(userInfo: widget.userInfo)),
      floatingActionButton: OptionsWidget(userInfo: widget.userInfo),
    );
  }
}

// class LimitlessWorld extends World {
//   LimitlessWorld({super.key, this.userInfo});
//   final dynamic userInfo;
//   @override
//   Future<void> onLoad() async {

//     final planet = Planet(position: Vector2(0, 0));
//     add(planet);
//     planet.add(RotateEffect.by(tau, EffectController(duration:10, infinite: true)));
//     add(TextComponent(
//         text: userInfo.worldname,
//         position: Vector2.all(-150),
//       ),);
//   }
// }