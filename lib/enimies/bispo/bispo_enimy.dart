import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:village/enimies/bispo/bispo_sprint_sheet.dart';
import 'package:village/game.dart';
import 'package:village/utils/attack/attack_sprite.dart';

class BispoEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement {
  bool canMove = true;
  BispoEnemy(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSize + 2,
              tileSize + 2,
            ),
            animation: SimpleDirectionAnimation(
                idleLeft: BispoEnemySpriteSheet.idLeft,
                idleRight: BispoEnemySpriteSheet.idRight,
                runRight: BispoEnemySpriteSheet.runRight,
                runLeft: BispoEnemySpriteSheet.runLeft),
            speed: 50) {
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
  }

  @override
  void update(double dt) {
    if (canMove) {
      seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            closePlayer: (player) {
              _executeAttack();
            },
            radiusVision: tileSize * 2,
            margin: 4,
          );
        },
        notObserved: () {
          runRandomMovement(dt);
        },
        radiusVision: tileSize * 2,
      );
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 2,
      align: const Offset(0, -5),
    );
    super.render(canvas);
  }

  @override
  void die() {
    final dieAnimation = lastDirectionHorizontal == Direction.left
        ? BispoEnemySpriteSheet.dieLeft
        : BispoEnemySpriteSheet.dieRight;
    animation?.playOnce(
      dieAnimation,
      runToTheEnd: true,
      onFinish: () {
        removeFromParent();
      },
    );
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    final receiveDamageAnimation = lastDirectionHorizontal == Direction.left
        ? BispoEnemySpriteSheet.recevieDamageLeft
        : BispoEnemySpriteSheet.recevieDamageRight;
    animation?.playOnce(
      receiveDamageAnimation,
      runToTheEnd: true,
      onFinish: () {
        canMove = true;
      },
    );
    super.receiveDamage(attacker, damage, identify);
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
}
