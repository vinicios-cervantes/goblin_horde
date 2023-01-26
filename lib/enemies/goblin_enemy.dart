import 'package:bonfire/bonfire.dart';
import 'package:goblin_horde/enemies/goblin_sprite.dart';
import 'package:goblin_horde/main.dart';

class GoblinEnemy extends SimpleEnemy with ObjectCollision {
  GoblinEnemy({required Vector2 position})
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
          speed: 50,
          animation: SimpleDirectionAnimation(
            idleRight: GoblinSprite.idleRight,
            runRight: GoblinSprite.runRight,
            idleLeft: GoblinSprite.idleLeft,
            runLeft: GoblinSprite.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize, tileSize),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
          damage: 1,
          size: Vector2(40, 40),
          direction: lastDirection,
          withPush: true,
        );
      },
      radiusVision: tileSize * 3,
    );

    super.update(dt);
  }
}
