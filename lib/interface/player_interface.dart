import 'dart:async' as async;

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late async.Timer _lifeTime;
  double life = 0;
  final double widthMax = 100;
  double widthCurrent = 100;
  Color color = Colors.green;

  @override
  void initState() {
    _lifeTime =
        async.Timer.periodic(const Duration(milliseconds: 100), _verifyLife);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/player/foto.png'),
                  scale: 0.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(120)),
        ),
        Stack(
          children: [
            Container(
              width: widthMax,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: widthCurrent,
              height: 30,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.2, color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  void _verifyLife(async.Timer timer) {
    if (life != widget.game.player?.life) {
      setState(() {
        life = widget.game.player?.life ?? 0;
        final percent = life / (widget.game.player?.maxLife ?? 0);
        widthCurrent = widthMax * percent;

        if (percent >= 0.4 && percent < 0.6) {
          color = Colors.amber;
        } else if (percent >= 0 && percent < 0.4) {
          color = Colors.red;
        } else {
          color = Colors.green;
        }
      });
    }
  }
}
