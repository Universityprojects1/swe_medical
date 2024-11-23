import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class StorageToken {
  final _storage = const FlutterSecureStorage();
  String? _token;

  Future<String?> getToken() async {
    _token = await _storage.read(key: "token");
    return _token;
  }

  setToken(String token) async {
    await _storage.write(value: token, key: "token");
  }

  deleteToken() async {
    await _storage.delete(key: "token");
  }
}