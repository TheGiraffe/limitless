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
import 'package:google_fonts/google_fonts.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MainGame extends FlameGame {
  @override
  MainGame({this.userInfo});
  final dynamic userInfo;
  late final RouterComponent router;

  @override
  void onLoad() {
    add(
      router = RouterComponent(
        initialRoute: 'home',
        routes: {
          'home': WorldRoute(() => WorldView(userInfo: userInfo)),
          'userworld': WorldRoute(() => UserWorld(userInfo: userInfo)),
        },
      ),
    );
  }
}

final regularText = TextPaint(
  style: TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: GoogleFonts.spaceMono().fontFamily,
  ),
);

final bigText = TextPaint(
  style: TextStyle(
    fontSize: 36,
    color: Colors.white,
    fontFamily: GoogleFonts.spaceMono().fontFamily,
  ),
);

class WorldView extends DecoratedWorld with HasGameReference {
  @override
  WorldView({this.userInfo});
  final dynamic userInfo;
  @override
  Future<void> onLoad() async {
    final planet = Planet(position: Vector2(0, 0), size: Vector2.all(200));
    planet.add(
      RotateEffect.by(tau, EffectController(duration: 10, infinite: true)),
    );
    addAll([
      planet,
      TextBoxComponent(
        text: "Welcome to " + userInfo.worldname + ",",
        textRenderer: regularText,
        position: Vector2(0, -220),
        anchor: Anchor.center,
        boxConfig: TextBoxConfig(timePerChar: 0.05, growingBox: true),
        align: Anchor.center,
      ),
      TimerComponent(
        period: 1.7,
        onTick: () => add(
          TextBoxComponent(
            text: userInfo.username,
            textRenderer: bigText,
            position: Vector2(0, -160),
            anchor: Anchor.center,
            boxConfig: TextBoxConfig(timePerChar: 0.07, growingBox: true),
            align: Anchor.center,
          ),
        ),
      ),
      TimerComponent(
        period: 3,
        onTick: () => add(
          TextBoxComponent(
            text: "Tap your world to enter.",
            textRenderer: regularText,
            position: Vector2(0, 180),
            anchor: Anchor.center,
            boxConfig: TextBoxConfig(timePerChar: 0.05, growingBox: true),
            align: Anchor.center,
          ),
        ),
      ),
    ]);
  }
}

class UserWorld extends DecoratedWorld with HasGameReference {
  @override
  UserWorld({this.userInfo});
  final dynamic userInfo;

  @override
  Future<void> onLoad() async {
    final limitlessbgtest = await TiledComponent.load(
      'firstmap.tmx',
      Vector2.all(32),
    );
    addAll([
      TextBoxComponent(
        text: "You have now entered the user's world!",
        textRenderer: bigText,
        position: Vector2(-50, 50),
      ),
      limitlessbgtest,
    ]);
  }
}

class Planet extends SpriteComponent
    with TapCallbacks, HasGameReference<MainGame> {
  Planet({super.position, super.size, super.key})
    : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('pngs/planets/craterplanet.png');
  }

  @override
  void onTapUp(TapUpEvent info) {
    game.router.pushNamed('userworld');
  }
}

class DecoratedWorld extends World with HasTimeScale {}
