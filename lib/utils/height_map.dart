import 'dart:collection';

import 'package:adventofcode2022/common/tuple.dart';

class HeightMap {
  HeightMap(String input)
      : map = [],
        start = Tuple(0, 0),
        end = Tuple(0, 0) {
    var rows = input.split('\n');
    for (int i = 0; i < rows.length; i++) {
      map.add([]);
      for (var char in rows[i].codeUnits) {
        if (char == 'S'.codeUnitAt(0)) {
          map[i].add(startValue);
          start = Tuple(i, map[i].length - 1);
        } else if (char == 'E'.codeUnitAt(0)) {
          map[i].add(endValue);
          end = Tuple(i, map[i].length - 1);
        } else {
          map[i].add(char.toInt());
        }
      }
    }
  }

  List<List<int>> map;
  Tuple<int> start;
  Tuple<int> end;

  static const startValue = 97;
  static const endValue = 122;

  int findShortestPathS() {
    return findShortestPath([start]);
  }

  int findShortestPathAll() {
    var startLocations = <Tuple>[];
    for (int i = 0; i < map.length; i++) {
      for(int j = 0; j < map[i].length; j++) {
        if (map[i][j] == startValue) {
          startLocations.add(Tuple(i,j));
        }
      }
    }

    return findShortestPath(startLocations);
  }

  int findShortestPath(List<Tuple> startingLocations) {
    var searchQueue = Queue<Tuple>.from(startingLocations);
    var visited = List.generate(
        map.length, (index) => List<bool>.filled(map[index].length, false));
    var depth = 0;

    while (searchQueue.isNotEmpty) {
      var levelSize = searchQueue.length;
      while (levelSize > 0) {
        var currentLocation = searchQueue.removeFirst();
        // Inspect the current location to find if its the goal
        if (currentLocation == end) {
          return depth;
        }

        // Look at the four barriers and add them to the queue if needed
        var up = Tuple(currentLocation.x - 1, currentLocation.y);
        var down = Tuple(currentLocation.x + 1, currentLocation.y);
        var left = Tuple(currentLocation.x, currentLocation.y - 1);
        var right = Tuple(currentLocation.x, currentLocation.y + 1);

        if (up.x >= 0) {
          checkMove(currentLocation, up, visited, searchQueue);
        }
        if (down.x != map.length) {
          checkMove(currentLocation, down, visited, searchQueue);
        }
        if (left.y >= 0) {
          checkMove(currentLocation, left, visited, searchQueue);
        }
        if (right.y != map[right.x].length) {
          checkMove(currentLocation, right, visited, searchQueue);
        }

        levelSize--;
      }
      depth++;
    }

    return -1;
  }

  void checkMove(
      Tuple currentLocation, Tuple locationToCheck, List<List<bool>> visited, Queue<Tuple> searchQueue) {
      var currentValue = map[currentLocation.x][currentLocation.y];
      var checkValue = map[locationToCheck.x][locationToCheck.y];
      if (!visited[locationToCheck.x][locationToCheck.y] && validMove(currentValue, checkValue)) {
        visited[locationToCheck.x][locationToCheck.y] = true;
        searchQueue.addLast(locationToCheck);
      }
  }

  bool validMove(int x, int y) {
    if (x + 1 == y) {
      // Only allowed to go up one level
      return true;
    } else if (x >= y) {
      // Can go down any levels
      return true;
    }

    return false;
  }
}
