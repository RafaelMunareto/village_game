import 'package:bonfire/bonfire.dart';

class AttackSpritesSheet {
  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        'abilities/atack_effect_left.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        'abilities/atack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
        'abilities/atack_effect_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
        'abilities/atack_effect_top.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
