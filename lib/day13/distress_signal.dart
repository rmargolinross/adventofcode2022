import 'dart:convert';

import '../common/tuple.dart';

class DistressSignal {
  DistressSignal(String input) : signal = [] {
    var lines = input.split('\n');
    for (int i = 0; i < lines.length; i += 3) {
      signal.add(Tuple(PacketData.fromSignal(lines[i]),
          PacketData.fromSignal(lines[i + 1])));
    }
  }

  List<Tuple<PacketData>> signal;

  int correctPackets() {
    var total = 0;
    for (int i = 0; i < signal.length; i++) {
      if (signal[i].x.compare(signal[i].y)) {
        total += i + 1;
      }
    }

    return total;
  }

  int sortPackets() {
    var allPackets = [];
    var divider1 = PacketData([
      [2]
    ]);
    var divider2 = PacketData([
      [6]
    ]);
    for (var pair in signal) {
      allPackets.add(pair.x);
      allPackets.add(pair.y);
    }
    allPackets.add(divider1);
    allPackets.add(divider2);

    allPackets.sort((a, b) => b._compare(b.data, a.data));

    return (allPackets.indexOf(divider1) + 1) *
        (allPackets.indexOf(divider2) + 1);
  }
}

class PacketData {
  PacketData(this.data);
  PacketData.fromSignal(String packetSignal) : data = [] {
    data = json.decode(packetSignal);
  }

  List data;

  bool compare(PacketData right) {
    return _compare(data, right.data) > -1;
  }

  int _compare(List left, List right) {
    for (int i = 0; i < left.length; i++) {
      var result = 0;
      if (right.length - 1 < i) {
        return -1;
      }

      if (left[i] is List && right[i] is List) {
        result = _compare(left[i], right[i]);
      } else if (left[i] is List) {
        result = _compare(left[i], [right[i]]);
      } else if (right[i] is List) {
        result = _compare([left[i]], right[i]);
      } else {
        if (left[i] < right[i]) {
          return 1;
        } else if (left[i] > right[i]) {
          return -1;
        }
      }

      if (result == 0) {
        continue;
      } else {
        return result;
      }
    }

    if (left.length < right.length) {
      return 1;
    }
    return 0;
  }
}
