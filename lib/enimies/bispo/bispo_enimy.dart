import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:village/enimies/bispo/bispo_sprint_sheet.dart';
import 'package:village/starter.dart';
import 'package:village/utils/attack/attack_sprite.dart';

class BispoEnemy extends SimpleEnemy with ObjectCollision {
  bool canMove = true;
  BispoEnemy(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSize + 2,
              tileSize + 2,
            ),
            animation: SimpleDirectionAnimation(
                idleLeft: BispoEnemySpriteSheet.heroIdLeft,
                idleRight: BispoEnemySpriteSheet.heroIdRight,
                runRight: BispoEnemySpriteSheet.heroRunRight,
                runLeft: BispoEnemySpriteSheet.heroRunLeft),
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
      seeAndMoveToPlayer(
          closePlayer: (player) {
            _executeAttack();
          },
          radiusVision: tileSize * 4,
          margin: 4);
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(canvas,
        borderRadius: BorderRadius.circular(5),
        borderWidth: 2.0,
        height: 2,
        align: const Offset(0, -3));
    super.render(canvas);
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(BispoEnemySpriteSheet.dieLeft,
          runToTheEnd: true, onFinish: () => removeFromParent());
    } else {
      animation?.playOnce(BispoEnemySpriteSheet.dieRight,
          runToTheEnd: true, onFinish: () => removeFromParent());
    }
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(BispoEnemySpriteSheet.recevieDamageLeft,
          runToTheEnd: true, onFinish: () {
        canMove = true;
      });
    } else {
      animation?.playOnce(BispoEnemySpriteSheet.recevieDamageRight,
          runToTheEnd: true, onFinish: () {
        canMove = true;
      });
    }
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
