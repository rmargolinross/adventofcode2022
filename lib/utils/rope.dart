import '../common/tuple.dart';

class Rope {
  Rope(int knots)
      : knots = List.generate(knots, (index) => Tuple(0,0)),
        headPath = [Tuple(0,0)],
        tailPath = [Tuple(0,0)];

  List<Tuple<int>> knots;
  List<Tuple<int>> headPath;
  List<Tuple<int>> tailPath;

  void move(String instructions) {
    instructions.split('\n').forEach((instruction) {
      for (int i = 0; i < int.parse(instruction.substring(2)); i++) {
        switch(instruction[0].toUpperCase()) {
          case 'R':
            moveRight();
            break;
          case 'L':
            moveLeft();
            break;
          case 'U':
            moveUp();
            break;
          case 'D':
            moveDown();
            break;
        }
      }
   });
  }

  void moveRight() {
    knots[0] = Tuple(knots[0].x + 1, knots[0].y);
    headPath.add(knots[0]);

    followHead();
  }

  void moveLeft() {
    knots[0] = Tuple(knots[0].x - 1, knots[0].y);
    headPath.add(knots[0]);
    
    followHead();
  }

  void moveUp() {
    knots[0] = Tuple(knots[0].x, knots[0].y + 1);
    headPath.add(knots[0]);
    
    followHead();
  }

  void moveDown() {
    knots[0] = Tuple(knots[0].x, knots[0].y - 1);
    headPath.add(knots[0]);
    
    followHead();
  }

  bool touching(Tuple<int> head, Tuple<int> tail) {
    return (head.x - tail.x).abs() < 2 && (head.y - tail.y).abs() < 2;
  }

  void followHead() {
    for (int i = 1; i < knots.length; i++) {
      if (touching(knots[i-1], knots[i])) {
        break;
      }

      var lead = knots[i-1];
      var follow = knots[i];

      if (lead.x == follow.x) {
        if (follow.y < lead.y) {
          knots[i] = Tuple(follow.x, follow.y + 1);
        } else {
          knots[i] = Tuple(follow.x, follow.y - 1);
        }
      } else if (lead.y == follow.y) {
        if (follow.x < lead.x) {
          knots[i] = Tuple(follow.x + 1, follow.y);
        } else {
          knots[i] = Tuple(follow.x - 1, follow.y);
        }
      } else {
        if (lead.x > follow.x) {
          if (lead.y > follow.y) {
            knots[i] = Tuple(follow.x + 1, follow.y + 1);
          } else {
            knots[i] = Tuple(follow.x + 1, follow.y - 1);
          }
        } else {
          if (lead.y > follow.y) {
            knots[i] = Tuple(follow.x - 1, follow.y + 1);
          } else {
            knots[i] = Tuple(follow.x - 1, follow.y - 1);
          }
        }
      }
    }

    tailPath.add(knots.last);
  }

  int countVisitedPlaces() {
    Set<Tuple<int>> visitedSpots = Set.from(tailPath);

    return visitedSpots.length;
  }
}
