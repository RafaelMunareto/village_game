import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:village/decoration/decoration_sprit_sheet.dart';
import 'package:village/player/game_hero.dart';
import 'package:village/game.dart';

class MushRoom extends GameDecoration with Sensor {
  MushRoom(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpritSheet.mushroom,
          size: Vector2(16, 16),
          position: position,
        );

  @override
  void onContact(GameComponent component) {
    if (component is GameHero) {
      component.addLife(20);
      removeFromParent();
    }
  }

  @override
  void onMount() {
    final initialPosition = position.translate(0, tileSize / 2);
    var deslocamentoX = (tileSize) * Random().nextDouble();
    var deslocamentoY = tileSize / 2 * Random().nextDouble();

    // ignore: avoid_single_cascade_in_expression_statements
    generateValues(const Duration(milliseconds: 400), onChange: (value) {
      double newX = Curves.decelerate.transform(value);
      double newY = Curves.bounceInOut.transform(value);
      position =
          initialPosition.translate(deslocamentoX * newX, deslocamentoY * newY);
    })
      ..start();

    super.onMount();
  }
}
