import 'dart:math';

import 'package:adventofcode2022/common/tuple.dart';

class Sensors {
  Sensors(String input) : sensors = [] {
    input.split('\n').forEach((line) {
      var chunks = line.split(' ');
      var sensorX = int.parse(chunks[2].split('=')[1].split(',')[0]);
      var sensorY = int.parse(chunks[3].split('=')[1].split(':')[0]);
      var beaconX = int.parse(chunks[8].split('=')[1].split(',')[0]);
      var beaconY = int.parse(chunks[9].split('=')[1].split(':')[0]);
      sensors.add(Sensor(Tuple(sensorX, sensorY), Tuple(beaconX, beaconY)));
    });
  }

  List<Sensor> sensors;

  int countCannotContain(int row) {
    Set<int> noSensors = {};
    for (var sensor in sensors) {
      if ((sensor.location.y - row).abs() <= sensor.manhattanDistance) {
        for (int x = (sensor.location.y - row).abs() - sensor.manhattanDistance;
            x <= sensor.manhattanDistance - (sensor.location.y - row).abs();
            x++) {
          noSensors.add(sensor.location.x + x);
        }
      }
    }

    for (var sensor in sensors) {
      if (sensor.location.y == row) {
        noSensors.remove(sensor.location.x);
      }
      if (sensor.closestBeacon.y == row) {
        noSensors.remove(sensor.closestBeacon.x);
      }
    }

    return noSensors.length;
  }

  int tuningFrequency() {
    // Find intersections
    Set<Tuple<int>?> intersections = {};
    for (var sensor in sensors) {
      for (var sensor2 in sensors) {
        // Each sensor has at max 2 intersections
        intersections.add(_findIntersection(sensor.top, sensor.left, sensor2.top, sensor2.right));
        intersections.add(_findIntersection(sensor.top, sensor.left, sensor2.bottom, sensor2.left));

        intersections.add(_findIntersection(sensor.top, sensor.right, sensor2.top, sensor2.left));
        intersections.add(_findIntersection(sensor.top, sensor.right, sensor2.bottom, sensor2.right));
      
        intersections.add(_findIntersection(sensor.bottom, sensor.left, sensor2.top, sensor2.left));
        intersections.add(_findIntersection(sensor.bottom, sensor.left, sensor2.bottom, sensor2.right));

        intersections.add(_findIntersection(sensor.bottom, sensor.right, sensor2.top, sensor2.right));
        intersections.add(_findIntersection(sensor.bottom, sensor.right, sensor2.bottom, sensor2.left));
      }
    }

    // Now loop through the intersections to check the locations round them
    intersections.removeWhere((intersection) => intersection == null || intersection.x < 0 || intersection.x > 4000000 || intersection.y < 0 || intersection.y > 4000000);
    for(var intersection in intersections) {
      var top = false, bottom = false, left = false, right = false;
      for(var sensor in sensors) {
        var distance = (sensor.location.x - intersection!.x).abs() + (sensor.location.y - intersection!.y).abs();
        if (distance < sensor.manhattanDistance) {
          top = true;
          bottom = true;
          left = true;
          right = true;
          break;
        } else if (distance == sensor.manhattanDistance) {
          if (intersection.x > sensor.location.x) {
            if (intersection.y > sensor.location.y) {
              top = true;
              left = true;
            } else {
              top = true;
              right = true;
            }
          } else {
            if (intersection.y > sensor.location.y) {
              bottom = true;
              left = true;
            } else {
              bottom = true;
              right = true;
            }
          }
        }
      }

      if (!top) {
        return (intersection!.x - 1) * 4000000 + intersection.y;
      } else if (!bottom) {
        return (intersection!.x + 1) * 4000000 + intersection.y;
      } else if (!left) {
        return intersection!.x * 4000000 + intersection.y - 1;
      } else if (!right) {
        return intersection!.x * 4000000 + intersection.y + 1;
      }
    }

    return 0;
  }

  Tuple<int>? _findIntersection(
      Tuple<int> a, Tuple<int> b, Tuple<int> c, Tuple<int> d) {
    var a1 = b.y - a.y;
    var b1 = a.x - b.x;
    var c1 = a1 * a.x + b1 * a.y;

    var a2 = d.y - c.y;
    var b2 = c.x - d.x;
    var c2 = a2 * c.x + b2 * c.y;

    var determinant = a1 * b2 - a2 * b1;

    if (determinant == 0) {
      return null;
    } else {
      var x = (b2 * c1 - b1 * c2) / determinant;
      var y = (a1 * c2 - a2 * c1) / determinant;

      if (min(a.x, b.x) <= x && x <= max(a.x, b.x)) {
        if (min(a.y, b.y) <= y && y <= max(a.y, b.y)) {
          return Tuple(x.toInt(), y.toInt());
        }
      }

      return null;
    }
  }
}

class Sensor {
  Sensor(this.location, this.closestBeacon)
      : manhattanDistance = 0,
        top = Tuple(location.x, location.y),
        bottom = Tuple(location.x, location.y),
        left = Tuple(location.x, location.y),
        right = Tuple(location.x, location.y) {
    manhattanDistance = (location.x - closestBeacon.x).abs() +
        (location.y - closestBeacon.y).abs();
    top = Tuple(location.x, location.y - manhattanDistance);
    bottom = Tuple(location.x, location.y + manhattanDistance);
    left = Tuple(location.x - manhattanDistance, location.y);
    right = Tuple(location.x + manhattanDistance, location.y);
  }

  Tuple<int> location;
  Tuple<int> closestBeacon;
  Tuple<int> top;
  Tuple<int> bottom;
  Tuple<int> left;
  Tuple<int> right;
  int manhattanDistance;
}
