class Crane {
  Crane(this.stacks, this.instructions);
  Crane.fromInput(String input) 
    : stacks = [], instructions = '' {
    var lines = input.split('\n');
    int bottomRow = 0;
    int stackCount = 0;
    for(int i = 0; i < lines.length; i++) {
      if (lines[i].replaceAll(' ', '')[0] == '1') {
        bottomRow = i;
        stackCount = lines[i].replaceAll(' ', '').length;
        break;
      }
    }

    // Set the instructions
    for(int i = bottomRow + 2; i < lines.length; i++) {
      if (i == lines.length - 1) {
        instructions += lines[i];
      } else {
        instructions += '${lines[i]}\n';
      }
    }

    // Fill the base stacks
    stacks = List<Stack>.generate(stackCount, (_) => Stack([]));

    // Start from the bottom row and fill each stack up
    for(int i = bottomRow - 1; i >= 0; i--) {
      var stack = 0;
      for(int j = 1; j < lines[0].length; j+= 4) {
        if (lines[i][j].trim().isNotEmpty) {
          stacks[stack].crates.add(lines[i][j]);
        }
        stack++;
      }
    }
  }

  List<Stack> stacks;
  String instructions;

  void moveCrates() {
    instructions.split('\n').forEach((instruction) {
      var parts = instruction.split(' ');
        for(int i = 0; i < int.parse(parts[1]); i++) {
          var crate = stacks[int.parse(parts[3]) - 1].crates.removeLast();
          stacks[int.parse(parts[5]) - 1].crates.add(crate);
        }
    });
  }

  void moveCrates9001() {
    instructions.split('\n').forEach((instruction) {
      var parts = instruction.split(' ');
      var fromStack = stacks[int.parse(parts[3]) - 1];
      stacks[int.parse(parts[5]) - 1].crates.addAll(fromStack.crates.getRange(fromStack.crates.length - int.parse(parts[1]), fromStack.crates.length));
      fromStack.crates.removeRange(fromStack.crates.length - int.parse(parts[1]), fromStack.crates.length);
    });
  }

  String getTopCrates() {
    String topCrates = '';
    for(Stack stack in stacks) {
      topCrates += stack.crates.last;
    }

    return topCrates;
  }
}

class Stack {
  Stack(this.crates);

  List<String> crates;
}