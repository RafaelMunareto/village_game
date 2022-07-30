import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:village/enimies/bispo/bispo_sprint_sheet.dart';
import 'package:village/player/hero_sprint_sheet.dart';
import 'package:village/game.dart';
import 'package:village/utils/attack/attack_sprite.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting, TapGesture {
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
        radius: tileSize * 1.5,
        color: Colors.transparent,
        withPulse: false,
        blurBorder: 16));
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

  @override
  void onTap() {
    TalkDialog.show(context, [
      Say(
          text: [
            const TextSpan(text: "Olá tudo bem?"),
          ],
          person: SizedBox(
            height: 100,
            width: 100,
            child: BispoEnemySpriteSheet.idRight.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "Tudo e você?"),
          ],
          person: SizedBox(
            height: 100,
            width: 100,
            child: HeroSpriteSheet.heroIdRight.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT)
    ]);
    // if (FollowerWidget.isVisible('identify')) {
    //   FollowerWidget.remove('identify');
    // } else {
    //   FollowerWidget.show(
    //       identify: 'identify',
    //       context: context,
    //       align: const Offset(30, -110),
    //       target: this,
    //       child: Card(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               const Icon(Icons.add),
    //               const Text('Olá'),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               ElevatedButton(
    //                   onPressed: () => FollowerWidget.remove('identify'),
    //                   child: const Text('OK'))
    //             ],
    //           ),
    //         ),
    //       ));
    // }
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
