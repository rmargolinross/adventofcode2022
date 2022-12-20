import 'dart:math';

class PlantedForest {
  PlantedForest(this.trees);
  PlantedForest.fromInput(String input) : trees = [] {
    for(String line in input.split('\n')) {
      trees.add([]);
      for(String tree in line.split('')) {
        trees.last.add(int.parse(tree));
      }
    }
  }

  List<List<int>> trees;

  int countVisibleTrees() {
    var visibleTrees = List.generate(trees.length, (i) => List.filled(trees[0].length, false));

    // First find all the rows
    for(int i = 0; i < trees.length; i++) {
      var row = trees[i];
      // Look left
      var currentBiggest = row[0];
      for(int j = 0; j < row.length; j++) {
        if (i == 0  || i == trees.length - 1 || j == 0) {
          visibleTrees [i][j] = true;
        } else if (row[j] > currentBiggest) {
          visibleTrees[i][j] = true;
          currentBiggest = row[j];
        }
      }

      // Look right
      currentBiggest = row[row.length - 1];
      for (int j = row.length - 1; j >= 0; j--) {
        if (i == 0 || i == trees.length - 1 || j == row.length - 1) {
          visibleTrees[i][j] = true;
        } else if (row[j] > currentBiggest) {
          visibleTrees[i][j] = true;
          currentBiggest = row[j];
        }
      }
    }

    // Find all the columns
    for(int j = 0; j < trees[0].length; j++) {
      var currentBiggest = trees[0][j];
      // Look down
      for(int i = 0; i < trees.length; i++) {
        if (j == 0 || j == trees[0].length - 1 || i == 0) {
          visibleTrees[i][j] = true;
        } else if (trees[i][j] > currentBiggest){
          visibleTrees[i][j] = true;
          currentBiggest = trees[i][j];
        }
      }

      // Look up
      currentBiggest = trees[trees.length - 1][j];
      for(int i = trees.length - 1; i >= 0; i--) {
        if (j == 0 || j == trees[0].length - 1 || i == trees.length - 1) {
          visibleTrees[i][j] = true;
        } else if (trees[i][j] > currentBiggest){
          visibleTrees[i][j] = true;
          currentBiggest = trees[i][j];
        }
      }
    }

    var count = 0;
    for(var row in visibleTrees) {
      for(var tree in row) {
        if (tree) {
          count++;
        }
      }
    }

    return count;
  }

  int findBestTreeHouse() {
    var best = 0;
    for (int i = 1; i < trees.length - 1; i++) {
      for (int j = 1; j < trees[i].length - 1; j++) {
        best = max(best, countTreeHouseView(i, j));
      }
    }

    return best;
  }

  int countTreeHouseView(int x, int y) {
    var height = trees[x][y];
    var top = 0;
    var bottom = 0;
    var left = 0;
    var right = 0;

    // left
    for (int i = x - 1; i >= 0; i--) {
      if (trees[i][y] == height) {
        left++;
        break;
      } else if (trees[i][y] < height) {
        left++;
      } else {
        break;
      }
    }

    // right
    for (int i = x + 1; i < trees.length; i++) {
      if (trees[i][y] == height) {
        right++;
        break;
      } else if (trees[i][y] < height) {
        right++;
      } else {
        break;
      }
    }

    // top
    for (int j = y - 1; j >= 0; j--) {
      if (trees[x][j] == height) {
        top++;
        break;
      } else if (trees[x][j] < height) {
        top++;
      } else {
        break;
      }
    }

    // bottom
    for (int j = y + 1; j < trees[x].length; j++) {
      if (trees[x][j] == height) {
        bottom++;
        break;
      } else if (trees[x][j] < height) {
        bottom++;
      } else {
        break;
      }
    }

    return top * bottom * left * right;
  }
}