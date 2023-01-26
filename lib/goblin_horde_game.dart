import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:goblin_horde/enemies/goblin_enemy.dart';
import 'package:goblin_horde/main.dart';
import 'package:goblin_horde/player/knight_player.dart';

class GoblinHordeGame extends StatelessWidget {
  const GoblinHordeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
      map: WorldMapByTiled(
        'map/tile/mapa_tiled.json',
        forceTileSize: Vector2(tileSize, tileSize),
      ),
      player: KnightPlayer(),
      cameraConfig: CameraConfig(
        zoom: 3,
        moveOnlyMapArea: true,
      ),
      components: [
        GoblinEnemy(position: Vector2(tileSize * 10, tileSize * 10)),
      ],
    );
  }
}
