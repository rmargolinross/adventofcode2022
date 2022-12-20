class Rucksack {
  Rucksack(this.compartment1, this.compartment2);
  Rucksack.fromFullRucksack(String bothCompartments) :
    compartment1 = bothCompartments.substring(0, bothCompartments.length ~/ 2),
    compartment2 = bothCompartments.substring(bothCompartments.length ~/ 2, bothCompartments.length);
  

  String compartment1;
  String compartment2;
  
  String getAllCompartments() {
    return compartment1 + compartment2;
  }

  String findSharedLetter() {
    var matchingLetter = '';
    compartment1.split('').forEach((letter) { 
      if (compartment2.contains(letter)) {
        matchingLetter = letter;
      }
    });

    return matchingLetter;
  }

  int getMatchingValue() {
    var letter = findSharedLetter();
    return getLetterValue(letter);
  }

  static getLetterValue(String letter) {
    if (letter.toUpperCase() == letter) {
      return letter.codeUnitAt(0) - 38;
    } else {
      return letter.codeUnitAt(0) - 96;
    }
  }
}