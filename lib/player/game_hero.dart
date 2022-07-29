import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:village/player/hero_sprint_sheet.dart';
import 'package:village/starter.dart';
import 'package:village/utils/attack/attack_sprite.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting {
  bool canMove = true;
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
            speed: 75) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize - 4, tileSize),
            align: Vector2(2, 2),
          ),
        ],
      ),
    );

    setupLighting(LightingConfig(
        radius: tileSize * 1.5, color: Colors.transparent, withPulse: false));
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 32) {
      _executeAttack();
    }

    super.joystickAction(event);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(HeroSpriteSheet.recevieDamageLeft, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    } else {
      animation?.playOnce(HeroSpriteSheet.recevieDamageRight, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(tileSize, tileSize),
      sizePush: tileSize / 2,
      animationLeft: AttackSpritesSheet.attackLeft,
      animationRight: AttackSpritesSheet.attackRight,
      animationDown: AttackSpritesSheet.attackBottom,
      animationUp: AttackSpritesSheet.attackTop,
    );
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(HeroSpriteSheet.dieLeft, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    } else {
      animation?.playOnce(HeroSpriteSheet.dieRight, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    }
    super.die();
  }
}
