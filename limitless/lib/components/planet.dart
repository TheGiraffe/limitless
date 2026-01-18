import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/geometry.dart';
import 'package:flame/extensions.dart';

class Planet extends SpriteComponent with TapCallbacks {
  Planet({ super.position, super.key }) :
    super(size: Vector2.all(100), anchor: Anchor.center);
  
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('pngs/planets/craterplanet.png');
  }

  @override
  void onTapUp (TapUpEvent info){
    size += Vector2.all(50);
  }
}