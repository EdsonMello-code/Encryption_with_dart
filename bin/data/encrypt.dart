import 'package:encrypt/encrypt.dart';

class EncryptAndDecrypt {
  final Key key;

  EncryptAndDecrypt(this.key);

  String encrypt(String value) {
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(value, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String value) {
    final decrypt = Encrypted.from64(value);

    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(decrypt, iv: iv);
    return decrypted;
  }
}
