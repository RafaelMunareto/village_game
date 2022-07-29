import 'package:bonfire/bonfire.dart';
import 'package:village/decoration/decoration_sprit_sheet.dart';
import 'package:village/player/game_hero.dart';

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
}
