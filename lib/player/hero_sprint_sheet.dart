import 'package:bonfire/bonfire.dart';

class HeroSpriteSheet {
  static Future<SpriteAnimation> get heroIdLeft => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );
  static Future<SpriteAnimation> get heroIdRight => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );

  static Future<SpriteAnimation> get recevieDamageRight => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 96),
        ),
      );

  static Future<SpriteAnimation> get recevieDamageLeft => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 96),
        ),
      );

  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 120),
        ),
      );
  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
        'player/robinHood_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(120, 120),
        ),
      );
}
