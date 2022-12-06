class Cleanup {
  Cleanup(this.cleanupList);
  Cleanup.fromInput(String input) : cleanupList = [] {
    input.split('\n').forEach((line) { 
      var parts = line.split(',');
      var section1 = Section(
        int.parse(parts[0].split('-')[0]),
        int.parse(parts[0].split('-')[1]));
      var section2 = Section(
        int.parse(parts[1].split('-')[0]),
        int.parse(parts[1].split('-')[1]));
      cleanupList.add(SectionPair(section1, section2));
    });
  }

  List<SectionPair> cleanupList;

  int countContainers() {
    var count = 0;
    for(SectionPair pair in cleanupList) {
      if (pair.isContained()) {
        count++;
      }
    }

    return count;
  }

  int countOverlaps() {
    var count = 0;
    for(SectionPair pair in cleanupList) {
      if (pair.isOverlapping()) {
        count++;
      }
    }

    return count;
  }
}

class SectionPair {
  SectionPair(this.section1, this.section2);

  Section section1;
  Section section2;

  bool isContained() {
    if (section1.min <= section2.min && section1.max >= section2.max) {
      return true;
    } else if (section2.min <= section1.min && section2.max >= section1.max) {
      return true;
    }

    return false;
  }

  bool isOverlapping() {
    if (section1.min > section2.max) {
      return false;
    } else if (section1.max < section2.min) {
      return false;
    } 

    return true;
  }
}

class Section {
  Section(this.min, this.max);

  int min;
  int max;
}