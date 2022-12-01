import 'elf.dart';

class CalorieCounter {
  static int findMaxCalories(List<Elf> elves) {
    int maxCalories = 0;
    for(Elf elf in elves) {
      var elfCalories = getElfCalories(elf);
      if (elfCalories > maxCalories) {
        maxCalories = elfCalories;
      }
    }

    return maxCalories;
  }

  static int findMaxXCalories(List<Elf> elves, int x) {
    List<int> totalCalories = [];
    for(Elf elf in elves) {
      totalCalories.add(getElfCalories(elf));
    }
    totalCalories.sort((x, y) => y-x);

    int total = 0;
    for(int i = 0; i < x; i++) {
      total += totalCalories[i];
    }
    return total;
  }

  static int getElfCalories(Elf elf) {
    var totalCalories = 0;
    for(int foodItem in elf.food ?? []) {
      totalCalories += foodItem;
    }
    return totalCalories;
  }
}