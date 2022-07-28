import 'package:bonfire/bonfire.dart';
import 'package:village/main.dart';
import 'package:village/player/hero_sprint_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  GameHero(Vector2 position)
      : super(
          position: position,
          size: Vector2(
            tileSize,
            tileSize,
          ),
          animation: SimpleDirectionAnimation(
              idleLeft: HeroSpriteSheet.heroIdLeft,
              idleRight: HeroSpriteSheet.heroIdRight,
              runRight: HeroSpriteSheet.heroRunRight,
              runLeft: HeroSpriteSheet.heroRunLeft),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(18, 20),
            align: Vector2(6, 10),
          ),
        ],
      ),
    );
  }
}
