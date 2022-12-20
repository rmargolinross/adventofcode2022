import 'dart:math';

import '../common/tuple.dart';

class Sand {
  Sand(String input, {hasFloor = false})
      : cave = [],
        sandStart = Tuple(500, 0) {
    // Find the largest x and y
    var largestX = 500;
    var largestY = 0;
    for (var line in input.split('\n')) {
      for (var pair in line.split('->')) {
        var values = pair.split(',');
        var x = int.parse(values[0].trim());
        var y = int.parse(values[1].trim());

        largestX = max(largestX, x);
        largestY = max(largestY, y);
      }
    }

    // Set up the initial cave
    if (hasFloor) {
      var floorWidth = sandStart.x * 2;
      cave = List.generate(floorWidth + 1,
          (index) => List.generate(largestY + 3, (_) => Element.air));
      for(int i = 0; i < cave.length; i++) {
        cave[i][largestY + 2] = Element.rock;
      }
    } else {
      cave = List.generate(largestX + 1,
          (index) => List.generate(largestY + 1, (_) => Element.air));
    }

    for (var rockFormation in input.split('\n')) {
      var pairs = rockFormation.split('->');

      // Add a rock line to the cave
      for (int i = 0; i < pairs.length - 1; i++) {
        var coordinatesStart = pairs[i].split(',');
        var coordinatesEnd = pairs[i + 1].split(',');

        var startx = int.parse(coordinatesStart[0].trim());
        var starty = int.parse(coordinatesStart[1].trim());
        var endx = int.parse(coordinatesEnd[0].trim());
        var endy = int.parse(coordinatesEnd[1].trim());
        if (startx == endx) {
          if (starty > endy) {
            for (int j = endy; j <= starty; j++) {
              cave[startx][j] = Element.rock;
            }
          } else {
            for (int j = starty; j <= endy; j++) {
              cave[startx][j] = Element.rock;
            }
          }
       } else {
          if (startx > endx) {
            for (int j = endx; j <= startx; j++) {
              cave[j][starty] = Element.rock;
            } 
          } else {
            for (int j = startx; j <= endx; j++) {
              cave[j][starty] = Element.rock;
            } 
          }
        }
      }
    }
  }

  List<List<Element>> cave;
  Tuple<int> sandStart;

  void dropSand() {
    var currentSand = sandStart;
    while(currentSand.x < cave.length - 1  && currentSand.x > 0 && currentSand.y < cave[currentSand.x].length - 1) {
      // check below
      if (cave[currentSand.x][currentSand.y+1] != Element.air) {
        if (cave[currentSand.x - 1][currentSand.y + 1] == Element.air) {
          // Sand falls to the left
          currentSand = Tuple(currentSand.x - 1, currentSand.y + 1);
        } else if (cave[currentSand.x + 1][currentSand.y + 1] == Element.air) {
          // Sand falls to the right
          currentSand = Tuple(currentSand.x + 1, currentSand.y + 1);
        } else {
          // Settled here and start a new sand
          cave[currentSand.x][currentSand.y] = Element.sand;
          // Make sure we did not add the start to the list
          if (currentSand == sandStart) {
            break;
          }
          currentSand = sandStart;
        }
      } else {
        // Sand keeps falling
        currentSand = Tuple(currentSand.x, currentSand.y + 1);
      }
    }
  }

  int countSand() {
    var total = 0;
    for (int i = 0; i < cave.length; i++) {
      for (int j = 0; j < cave[i].length; j++) {
        if (cave[i][j] == Element.sand) {
          total++;
        }
      }
    }

    return total;
  }

  @override
  String toString() {
    var string = '';
    for(int j = 0; j < cave[0].length; j++) {
      for (int i = 0; i < cave.length; i++) {
        switch(cave[i][j]) {
          case Element.air:
            string += '.';
            break;
          case Element.rock:
            string += '#';
            break;
           case Element.sand:
            string += 'o';
            break;
        }
      }
      if (j < cave[0].length) {
        string += '\n';
      }
    }

    return string;
  }
}

enum Element { air, rock, sand }
