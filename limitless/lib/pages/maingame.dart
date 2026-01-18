import 'package:Limitless/pages/settings.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/rendering.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flame/text.dart';
// import '../components/planet.dart';

class MainGame extends FlameGame {
  @override
  MainGame({this.userInfo});
  final dynamic userInfo;
  late final RouterComponent router;

  @override
  void onLoad() {
    add(
      router = RouterComponent(initialRoute: 'home', 
      routes: {
        'home': WorldRoute(() => WorldView(userInfo: userInfo)),
        'userworld': WorldRoute(() => UserWorld(userInfo: userInfo))
      })
    );
  }
}

class WorldView extends DecoratedWorld with HasGameReference {
  @override
  WorldView({this.userInfo});
  final dynamic userInfo;
  @override
  Future<void> onLoad() async {
    final planet = Planet(
      position: Vector2(0, 0));
    planet.add(RotateEffect.by(tau, EffectController(duration:10, infinite: true)));
    addAll([
      planet,
      TextBoxComponent(
        text: userInfo.worldname,
        position: Vector2(-150, 50),
        size: Vector2(1000, 100)
      )
    ]);
  }
}

class UserWorld extends DecoratedWorld with HasGameReference {
  @override
  UserWorld({this.userInfo});
  final dynamic userInfo;

  @override
  Future<void> onLoad() async {
    addAll([
      TextBoxComponent(
        text: "You have now entered the user's world!",
        position: Vector2(-50, 50)
      )
    ]);
  }
}

class Planet extends SpriteComponent with TapCallbacks, HasGameReference<MainGame> {
  Planet({ super.position, super.key }) :
    super(size: Vector2.all(100), anchor: Anchor.center);
  
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('pngs/planets/craterplanet.png');
  }

  @override
  void onTapUp (TapUpEvent info){
    game.router.pushNamed('userworld');
  }
}

class DecoratedWorld extends World with HasTimeScale{

}
