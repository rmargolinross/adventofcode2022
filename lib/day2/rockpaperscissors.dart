class RockPaperScissors{
  RockPaperScissors({required this.games});
  static RockPaperScissors fromInput(input) {
    List<Game> games = [];
    for(String game in input.split('\n')) {
      games.add(Game(
        opponent: ChoiceExt.getChoice(game[0]),
        you: ChoiceExt.getChoice(game[2], rock: 'X', paper: 'Y', scissors: 'Z')
      ));
    }
    
    return RockPaperScissors(games: games);
  }

  static RockPaperScissors fromInputMode2(input) {
    List<Game> games = [];
    for(String game in input.split('\n')) {
      var opponent = ChoiceExt.getChoice(game[0]);
      var you = Choice.rock;
      if (opponent == Choice.rock) {
        switch(game[2]) {
          case 'X':
            you = Choice.scissors;
            break;
          case 'Y':
            you = Choice.rock;
            break;
          case 'Z':
            you = Choice.paper;
            break;
        }
      } else if (opponent == Choice.paper) {
        switch(game[2]) {
          case 'X':
            you = Choice.rock;
            break;
          case 'Y':
            you = Choice.paper;
            break;
          case 'Z':
            you = Choice.scissors;
            break;
        }
      } else {
         switch(game[2]) {
          case 'X':
            you = Choice.paper;
            break;
          case 'Y':
            you = Choice.scissors;
            break;
          case 'Z':
            you = Choice.rock;
            break;
        }
      }
      games.add(Game(
        opponent: opponent,
        you: you
      ));
    }
    
    return RockPaperScissors(games: games);
  }

  final List<Game> games;

  int getTotalScore() {
    var total = 0;
    for (var game in games) {
      total += game.score();
    }

    return total;
  }
}

class Game {
  Game({required this.opponent, required this.you});
  
  final Choice opponent;
  final Choice you;

  int score() {
    if (opponent == you) {
      return 3 + you.value();
    }
    if (opponent == Choice.rock) {
      if (you == Choice.paper) {
        return 6 + you.value();
      } else {
        return 0 + you.value();
      }
    } else if (opponent == Choice.paper) {
      if (you == Choice.scissors) {
        return 6 + you.value();
      } else {
        return you.value();
      }
    } else if (you == Choice.rock) {
      return 6 + you.value();
    } else {
      return you.value();
    }
  }
}

enum Choice {
  rock, paper, scissors
}

extension ChoiceExt on Choice {
  static Choice getChoice(
    String input, 
    {
      String rock = 'A', 
      String paper = 'B', 
      String scissors = 'C'
    }
  ) {
    if (input == rock) {
      return Choice.rock;
    } else if (input == paper) {
      return Choice.paper;
    } else if (input == scissors) {
      return Choice.scissors;
    } else {
      return Choice.rock;
    }
  }

  int value() {
    switch(this) {
      case Choice.rock:
        return 1;
      case Choice.paper:
        return 2;
      case Choice.scissors:
        return 3;
    }
  }
}