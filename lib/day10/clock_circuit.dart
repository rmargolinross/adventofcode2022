class ClockCircuit {
  ClockCircuit(): cycle = 0, registerX = 1;

  int registerX;
  int cycle;

  int getSignalStrengths(String instructions, List<int> signalIntervals) {
    int total = 0;
    runInstructions(instructions, () => {
      if (signalIntervals.contains(cycle)) {
        total += cycle * registerX
      }
    });

    return total;
  }

  String drawCRT(String instructions) {
    var crt = List<bool>.filled(240, false);
    runInstructions(instructions, () {
      if ((cycle - 1) % 40 >= registerX - 1 && (cycle - 1) % 40 <= registerX + 1) {
        crt[cycle - 1] = true;
      } else {
        crt[cycle - 1] = false;
      }
    });

    var picture = StringBuffer();
    for(int i = 0; i < crt.length; i++) {
      if((i) % 40 == 0) {
        picture.write('\n');
      }
      if (crt[i]) {
        picture.write('#');
      } else {
        picture.write(' ');
      }
      
    }

    return picture.toString();
  }

  void runInstructions(String instructions, Function cycleCheck) {
    instructions.split('\n').forEach((instruction) {
      if (instruction.startsWith('noop')) {
        cycle++;
        cycleCheck();
      } else {
        cycle++;
        cycleCheck();
        cycle++;
        cycleCheck();
        registerX += int.parse(instruction.substring(5));
      }
    });
 
  }
}