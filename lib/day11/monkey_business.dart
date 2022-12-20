class MonkeyBusiness {
  MonkeyBusiness(String input) : monkeys = [], divs = 1 {
    var lines = input.split('\n');
    var numberOfMonkeys = (lines.length + 1) ~/ 7;

    monkeys = List.generate(numberOfMonkeys, (index) => Monkey());
    var currentMonkey = monkeys[0];

    for (int i = 0; i < lines.length; i++) {
      var line = lines[i].trim();
      if (line.startsWith('Monkey')) {
        currentMonkey = monkeys[int.parse(line.split(' ')[1].split(':')[0])];
      }

      if (line.startsWith('Starting items')) {
        // Fill the starting items
        line.split(':')[1].split(',').forEach((number) {
          currentMonkey.items.add(int.parse(number.trim()));
        });
      }

      if (line.startsWith('Operation')) {
        // Fill the operation
        var operationParts = line.split(':')[1].split(' ');
        currentMonkey.operation = (old) => process(old, operationParts[4],
            operationParts[5] == 'old' ? old : int.parse(operationParts[5]));
      }

      if (line.startsWith('Test')) {
        // Fill the test
        var divisibleBy = int.parse(line.split(' ')[3]);
        divs *= divisibleBy;
        currentMonkey.test = (item) {
          if (item % divisibleBy == 0) {
            monkeys[int.parse(lines[i + 1].trim().split(' ')[5])].items.add(item);
          } else {
            monkeys[int.parse(lines[i + 2].trim().split(' ')[5])].items.add(item);
          }
        };
      }
    }
  }

  int process(int a, String operator, int b) {
    switch (operator) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a ~/ b;
      case '%':
        return a % b;
    }

    throw ArgumentError(operator);
  }

  List<Monkey> monkeys;
  int divs;

  void makeRound(bool worryReduced) {
    for(var monkey in monkeys) {
      monkey.takeTurn(worryReduced,divs);
    }
  }

  int getMonkeyBusiness() {
    var sortedList = List<Monkey>.from(monkeys);
    sortedList.sort(((a, b) => b.itemsInspected - a.itemsInspected));

    return sortedList[0].itemsInspected * sortedList[1].itemsInspected;
  }
}

class Monkey {
  Monkey()
      : items = [],
        itemsInspected = 0;

  List<int> items;
  int itemsInspected;
  int Function(int)? operation;
  void Function(int)? test;

  void takeTurn(bool worryReduced, int divs) {
    while(items.isNotEmpty) {
      var item = items.removeAt(0);
      item = operation!(item);
      itemsInspected++;
      if(worryReduced) {
        // Inspected but not damaged worry level goes down
        item = (item / 3).floor();
      } else {
        item = item % divs;
      }
      test!(item);
    }
  }
}
