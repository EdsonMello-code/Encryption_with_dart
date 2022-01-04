import 'dart:io';

import '../../core/failures/file_failure.dart';

class ManipulateFile {
  Future<void> saveInFile(String value, [String? filePath]) async {
    final fileWithPassword = File(filePath ?? 'file.txt');

    if (await fileWithPassword.exists()) {
      final content = await fileWithPassword.readAsString();
      final newContent = '$content\n$value';
      await fileWithPassword.writeAsString(newContent);
    } else {
      await fileWithPassword.writeAsString(value);
    }
  }

  Future<List<String>> readFile(String fileName) async {
    final file = File(fileName);
    if (!await file.exists()) {
      throw FileFailure(message: 'File not exist');
    }

    final lines = file.readAsLines();
    return lines;
  }
}
