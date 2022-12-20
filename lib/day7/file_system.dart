import 'dart:math';

class FileSystem {
  FileSystem(String map)
      : topFolder = Folder(name: '/', subFolders: [], files: []) {
    // Process the input and fill in the top folder
    var currentFolder = topFolder;
    var lines = map.split('\n');
    for(int i = 0; i < lines.length; i++) {
      var line = lines[i];
      if (line.startsWith('\$')) {
        if (line.substring(2,4) == 'cd') {
          if (line.substring(5) == '/') {
            currentFolder = topFolder;
          } else if (line.substring(5) == '..') {
            currentFolder = currentFolder.parent ?? topFolder;
          } else {
            currentFolder = currentFolder.subFolders.firstWhere((folder) => folder.name == line.substring(5));
          }
        } else if (line.substring(2,4) == 'ls') {
          // Loop through the lines until you find the next $ symbol
          var nextLine = lines[i+1];
          while(!nextLine.startsWith('\$')) {
            if (nextLine.startsWith('dir') && currentFolder.subFolders.indexWhere((subFolder) => subFolder.name == nextLine.substring(4)) == -1) {
              currentFolder.subFolders.add(Folder(name: nextLine.substring(4), subFolders: [], files: [], parent: currentFolder));
            } else if (!nextLine.startsWith('dir')) {
              var fileName = nextLine.split(' ')[1];
              var fileSize = int.parse(nextLine.split(' ')[0]);
              currentFolder.files.add(File(name: fileName, size: fileSize));
            }
            i++;
            if (i+1 >= lines.length) {
              break;
            }
            nextLine = lines[i+1];
          }
        }
      }
    }
  }

  Folder topFolder;

  int getSumOfFolders(int maxSize, {Folder? currentFolder}) {
    var currentTotal = 0;
    for(Folder folder in currentFolder?.subFolders ?? topFolder.subFolders) {
      if (folder.getSize() <= maxSize) {
        currentTotal += folder.getSize();
      }
      currentTotal += getSumOfFolders(maxSize, currentFolder: folder);
    }
    
    return currentTotal;
  }

  int smallestFolderOfSize(int minSize, {Folder? currentFolder, int? currentSmallest}) {
    currentSmallest = currentSmallest ?? topFolder.getSize();

    for(Folder folder in currentFolder?.subFolders ?? topFolder.subFolders) {
      var folderSize = folder.getSize();
      if (folderSize > minSize) {
        currentSmallest = min(currentSmallest!, folderSize);
        currentSmallest = smallestFolderOfSize(minSize, currentFolder: folder, currentSmallest: currentSmallest);
      }
    }

    return currentSmallest!;
  }
}

class Folder {
  Folder({required this.name, required this.subFolders, required this.files, this.parent});

  String name;
  Folder? parent;
  List<Folder> subFolders;
  List<File> files;

  int getSize() {
    var totalSize = 0;
    for(File file in files) {
      totalSize += file.size;
    }
    for(Folder subFolder in subFolders) {
      totalSize += subFolder.getSize();
    }

    return totalSize;
  }
}

class File {
  File({required this.name, required this.size});

  String name;
  int size;
}
