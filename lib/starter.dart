import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:village/main.dart';
import 'package:village/player/game_hero.dart';

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(directional: JoystickDirectional()),
      map: TiledWorldMap('maps/map2.json',
          forceTileSize: const Size(tileSize, tileSize)),
      player: GameHero(Vector2(31 * tileSize, 13 * tileSize)),
      showCollisionArea: false,
    );
  }
}
