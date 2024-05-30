import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

/// @author luwenjie on 2023/3/18 21:01:20
///
///
class EncryptUtil {
  static final _ivBytes = Uint8List.fromList([
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00
  ]);

  static String hmacBase64(
      {required String secret,
      required String payload,
      crypto.Hash hash = crypto.sha1}) {
    final crypto.Hmac hmac = crypto.Hmac(hash, utf8.encode(secret));
    final crypto.Digest digest = hmac.convert(utf8.encode(payload));
    return base64.encode(digest.bytes);
  }

  static Encrypted rsa(
      {required String privateKey,
      required String publicKey,
      required String payload,
      crypto.Hash hash = crypto.sha1}) {
    // final privateRSAAsymmetricKey = RSAKeyParser().parse(privateKey);
    final publicRSAAsymmetricKey = RSAKeyParser().parse(publicKey);

    final encrypter = Encrypter(RSA(
      publicKey: RSAPublicKey(
          publicRSAAsymmetricKey.modulus!, publicRSAAsymmetricKey.exponent!),
    ));
    return encrypter.encrypt(payload);
  }

  /// 使用HMAC-SHA1计算摘要 输出为 16 进制
  ///
  static String hmacHex(
      {required String secret,
      required String payload,
      crypto.Hash hash = crypto.sha1}) {
    return hex.encode(crypto.Hmac(hash, utf8.encode(secret))
        .convert(utf8.encode(payload))
        .bytes);
  }

  static String md5(Object data) {
    if (data is List<int>) {
      final crypto.Digest digest = crypto.md5.convert(data);
      return base64.encode(digest.bytes);
    } else if (data is String) {
      return crypto.md5.convert(utf8.encode(data)).toString();
    } else if (data is File) {
      return crypto.md5
          .convert(data.readAsBytesSync())
          .toString(); // 283M文件用时14148毫秒
    } else {
      throw Error();
    }
  }

  /// 283M文件用时24719毫秒
  static Future<String> md5File(File file) async {
    final Stream<crypto.Digest> sink = crypto.md5.bind(file.openRead());
    return await sink
        .map<String>((event) => hex.encode(event.bytes))
        .reduce((previous, element) => previous + element);
  }

  static Future<String> md5FileBase64(File file) async {
    final Stream<crypto.Digest> sink = crypto.md5.bind(file.openRead());
    return await sink
        .map<String>((event) => base64Encode(event.bytes))
        .reduce((previous, element) => previous + element);
  }

  static String sha256(dynamic data) {
    if (data is Uint8List) {
      return crypto.sha256.convert(data).toString();
    } else if (data is String) {
      return crypto.sha256.convert(utf8.encode(data)).toString();
    }
    throw Exception("unsupport ${data.runtimeType}");
  }

  static String aesEncrypt({required Key key, required String data}) {
    var crypt = AES(key, mode: AESMode.cbc);
    return crypt
        .encrypt(Uint8List.fromList(utf8.encode(data)), iv: IV(_ivBytes))
        .base64;
  }

  static String aesDecrypt({required Key key, required String data}) {
    var crypt = AES(
      key,
      mode: AESMode.cbc,
    );
    try {
      return utf8
          .decode(crypt.decrypt(Encrypted.fromBase64(data), iv: IV(_ivBytes)));
    } catch (e) {
      return "";
    }
  }

  static String base64Encode(Object s) {
    if (s is List<int>) {
      return base64.encode(s);
    }
    return base64.encode(utf8.encode(s.toString()));
  }

  static String base64Decode(String s) {
    return utf8.decode(base64.decode(s));
  }
}
