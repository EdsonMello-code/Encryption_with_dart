import 'package:encrypt/encrypt.dart';

import 'data/encrypt.dart';
import 'data/files/encrypt_and_decrypt_file.dart';
import 'data/files/manipulate_file.dart';

void main() async {
  final manipulate = EncryptAndDecryptFile(
    manipulateFile: ManipulateFile(),
    securePassword: EncryptAndDecrypt(
      Key.fromUtf8(
        'ffffffffffffffffffffffffffffffff',
      ),
    ),
  );

  await manipulate.encrypt('password_encripted.txt');
}
