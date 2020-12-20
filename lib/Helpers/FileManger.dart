import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileManager {
  Future<String> _localStoragePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localeFile(String filename) async {
    final documentDirectoryPath = await _localStoragePath();
    return File('$documentDirectoryPath/$filename');
  }

  void saveStringToFile(String fileName, String content) async {
    var file = await _localeFile(fileName);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    await file.writeAsString(content);
  }

  Future<String> readStringFrom(String fileName) async {
    var file = await _localeFile(fileName);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return await file.readAsString();
  }
}
