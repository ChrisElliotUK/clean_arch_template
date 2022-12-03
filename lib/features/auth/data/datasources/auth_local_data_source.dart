import '../../../../core/cache/cache.dart';
import '../../../../core/cache/secure_storage/secure_storage_operator.dart';

abstract class AuthLocalDataSource {
  Future<bool> cacheAuthToken(String token);
  Future<String> getCachedAuthToken();
  Future<bool> clearAuthToken();
  Future<void> clearSecureStorage();
  Future<bool> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageOperator _secureStorageOperator;
  final Cache _cache;

  AuthLocalDataSourceImpl(this._secureStorageOperator, this._cache);
  @override
  Future<bool> cacheAuthToken(String token) async {
    final result = await _secureStorageOperator.set(AUTH_TOKEN, token);

    return result;
  }

  @override
  Future<String> getCachedAuthToken() async {
    final result = await _secureStorageOperator.get(AUTH_TOKEN, 'ERROR');

    return result;
  }

  @override
  Future<bool> clearAuthToken() async {
    final result = await _secureStorageOperator.remove(AUTH_TOKEN);

    return result;
  }

  @override
  Future<void> clearSecureStorage() async {
    await _secureStorageOperator.clear();
  }

  @override
  Future<bool> clearCache() async {
    final result = await _cache.clear();

    return result;
  }
}
