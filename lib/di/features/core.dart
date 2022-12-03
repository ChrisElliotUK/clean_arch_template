import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_client.dart';
import '../../core/cache/cache.dart';
import '../../core/cache/secure_storage/secure_storage_operator.dart';
import '../../core/cache/shared_preferences_operator.dart';
import '../injection_container.dart';

void core() async {
  // External Providers
  final sharedPrefrences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefrences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => dioClient);
  // Core
  sl.registerLazySingleton<Cache>(() => CacheImpl());
  sl.registerLazySingleton(() => SharedPreferencesOperator(sl()));
  sl.registerLazySingleton(() => SecureStorageOperator(sl()));
  sl.registerLazySingleton(() => ApiClient(sl()));
}
