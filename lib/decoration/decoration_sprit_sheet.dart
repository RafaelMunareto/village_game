import 'package:bonfire/bonfire.dart';

class DecorationSpritSheet {
  static Future<Sprite> get chess => Sprite.load(
        'maps/swampObjects_.png',
        srcPosition: Vector2(64, 80),
        srcSize: Vector2(16, 32),
      );
  static Future<Sprite> get chessOpen => Sprite.load(
        'maps/swampObjects_.png',
        srcPosition: Vector2(80, 80),
        srcSize: Vector2(16, 32),
      );

  static Future<Sprite> get mushroom => Sprite.load(
        'maps/swampObjects_.png',
        srcPosition: Vector2(128, 16),
        srcSize: Vector2(16, 16),
      );
}
