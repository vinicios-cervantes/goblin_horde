import 'package:bonfire/bonfire.dart';
import 'package:goblin_horde/main.dart';
import 'package:goblin_horde/player/knight_sprite.dart';

class KnightPlayer extends SimplePlayer with ObjectCollision {
  KnightPlayer()
      : super(
          position: Vector2(tileSize * 5, tileSize * 5),
          speed: 300,
          life: 10,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleLeft: KnightSprite.idleLeft,
            idleRight: KnightSprite.idleRight,
            runRight: KnightSprite.runRight,
            runLeft: KnightSprite.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize, tileSize),
            align: Vector2(0, 0),
          )
        ],
      ),
    );
  }
}
