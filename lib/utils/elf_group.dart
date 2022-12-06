import 'package:adventofcode2022/utils/rucksack.dart';

class ElfGroup {
  ElfGroup(this.elf1, this.elf2, this.elf3);

  Rucksack elf1;
  Rucksack elf2;
  Rucksack elf3;

  String findSharedLetter() {
    var sharedLetter = '';
    elf1.getAllCompartments().split('').forEach((letter) { 
      if (elf2.getAllCompartments().contains(letter) && elf3.getAllCompartments().contains(letter)) {
        sharedLetter = letter;
      }
    });

    return sharedLetter;
  }

  int getBadgePriority() {
    return Rucksack.getLetterValue(findSharedLetter());
  }
}