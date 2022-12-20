class Device {
  Device({required this.startOfPacketPostion, required this.startOfMessagePosition});
  Device.init(String input) 
    : startOfPacketPostion = 0, startOfMessagePosition = 0 {
    startOfPacketPostion = findStartOfPacketPosition(input);
    startOfMessagePosition = findStartOfMessagePosition(input);
  }

  int startOfPacketPostion;
  int startOfMessagePosition;

  static int findStartOfPacketPosition(String signals) {
    return findMarker(signals, 4);
  }

  static int findStartOfMessagePosition(String signals) {
    return findMarker(signals, 14);
  }

  static int findMarker(String signals, int markerSize) {
    Set<String> currentCharsUnique = {};

    for(int i = markerSize-1; i < signals.length; i++) {
      currentCharsUnique = Set.from(signals.substring(i-markerSize+1, i+1).split(''));
      if (currentCharsUnique.length == markerSize) {
        return i+1;
      }
    }

    return -1;
  }
}
