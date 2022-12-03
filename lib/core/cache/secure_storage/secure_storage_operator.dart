import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageOperator {
  SecureStorageOperator(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<String> get(String key, String defaultValue) async {
    try {
      final result = await _secureStorage.read(key: key) ?? json.encode(defaultValue);

      return await json.decode(result);
    } on FormatException catch (e) {
      log(e.toString());
      return defaultValue;
    } catch (e) {
      log(e.toString());
      return defaultValue;
    }
  }

  Future<bool> set(String key, String value) async {
    await _secureStorage.write(key: key, value: json.encode(value));

    return await _secureStorage.containsKey(key: key);
  }

  Future<bool> remove(String key) async {
    await _secureStorage.delete(key: key);

    return await _secureStorage.containsKey(key: key);
  }

  Future<bool> containsKey(String key) async {
    return await _secureStorage.containsKey(key: key);
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
