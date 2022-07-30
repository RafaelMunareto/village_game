import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:village/controller/my_game_controller.dart';
import 'package:village/decoration/chees.dart';
import 'package:village/decoration/lamp.dart';
import 'package:village/decoration/mushroom.dart';
import 'package:village/enimies/bispo/bispo_enimy.dart';
import 'package:village/interface/player_interface.dart';
import 'package:village/player/game_hero.dart';

const double tileSize = 16;

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<GameComponent> enemies = [];
  @override
  void initState() {
    switch (widget.stage) {
      case 1:
        enemies.add(BispoEnemy(_getWorldPosition(20, 16)));
        break;
      case 2:
        enemies.add(BispoEnemy(_getWorldPosition(11, 10)));
        enemies.add(BispoEnemy(_getWorldPosition(14, 18)));
        break;
      case 3:
        enemies.add(BispoEnemy(_getWorldPosition(22, 15)));
        enemies.add(BispoEnemy(_getWorldPosition(27, 22)));
        enemies.add(BispoEnemy(_getWorldPosition(27, 26)));
        break;
    }
    super.initState();
  }

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
      components: [MyGameController(widget.stage), ...enemies],
      map: TiledWorldMap('maps/map2.json', objectsBuilder: {
        // 'bispo': (properties) => BispoEnemy(properties.position),
        // 'richard': (properties) => RichardEnemy(properties.position),
        'lamp': ((properties) => Lamp(properties.position)),
        'chess': ((properties) => Chess(properties.position)),
        'mushroom': ((properties) => MushRoom(properties.position))
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

  Vector2 _getWorldPosition(int x, int y) {
    return Vector2(x * tileSize, y * tileSize);
  }
}
