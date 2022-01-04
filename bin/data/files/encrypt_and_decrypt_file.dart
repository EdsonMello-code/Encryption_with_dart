import '../../core/failures/file_failure.dart';
import '../encrypt.dart';
import 'manipulate_file.dart';

class EncryptAndDecryptFile {
  final ManipulateFile manipulateFile;

  final EncryptAndDecrypt securePassword;

  EncryptAndDecryptFile({
    required this.manipulateFile,
    required this.securePassword,
  });

  Future<void> encrypt(String path) async {
    try {
      final contentOfUncryptedFile = await manipulateFile.readFile(path);
      final lineEncrypted =
          contentOfUncryptedFile.map((e) => securePassword.encrypt(e)).toList();
      for (var e in lineEncrypted) {
        await manipulateFile.saveInFile(
          e,
        );
      }
    } on FileFailure {
      rethrow;
    }
  }
}
