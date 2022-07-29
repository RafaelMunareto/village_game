import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:village/decoration/lamp.dart';
import 'package:village/enimies/bispo/bispo_enimy.dart';
import 'package:village/enimies/richard/richard_enimy.dart';
import 'package:village/interface/player_interface.dart';
import 'package:village/player/game_hero.dart';

const double tileSize = 16;

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(
            color: Colors.orange, margin: const EdgeInsets.all(64)),
        actions: [
          JoystickAction(
              actionId: 32,
              color: Colors.red,
              margin: const EdgeInsets.all(48)),
        ],
        keyboardConfig: KeyboardConfig(
          enable: true,
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
      map: TiledWorldMap('maps/map2.json', objectsBuilder: {
        'bispo': (properties) => BispoEnemy(properties.position),
        'richard': (properties) => RichardEnemy(properties.position),
        'lamp': ((properties) => Lamp(properties.position))
      }),
      player: GameHero(Vector2(21 * tileSize, 13 * tileSize)),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game)
      },
      initialActiveOverlays: const [PlayerInterface.overlayKey],
      cameraConfig: CameraConfig(
          moveOnlyMapArea: true,
          zoom: 4.0,
          sizeMovementWindow: Vector2(tileSize * 4, tileSize * 4)),
      showCollisionArea: false,
      lightingColorGame: Colors.black.withOpacity(0.4),
    );
  }
}
