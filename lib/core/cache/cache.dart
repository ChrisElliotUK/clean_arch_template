import 'dart:convert';

import '../../di/injection_container.dart' as di;
import 'shared_preferences_operator.dart';

export 'cache_values.dart';

abstract class Cache {
  Map<String, dynamic> loadJson(String key, {Map<String, dynamic> defaultValue = const <String, dynamic>{}});
  List<Map<String, dynamic>>? loadJsonList(String key, {List<Map<String, dynamic>>? defaultValue});
  Future<bool> saveJson(String key, Map<String, dynamic> value);
  Future<bool> saveJsonList(String key, List<Map<String, dynamic>> value);
  Future<bool> remove(String key);
  Future<bool> clear();
  bool contains(String key);
  Future<bool> save<T>(String key, T value);
  T load<T>(String key, T defaultValue);
}

class CacheImpl implements Cache {
  /// Get a JSON value from the shared preferences.
  /// [key] is the key of the value to get.
  /// [defaultValue] is the value to return if the key is not found.
  /// Returns the value for the given key or the default value if the key is not found.
  @override
  Map<String, dynamic> loadJson(String key, {Map<String, dynamic> defaultValue = const <String, dynamic>{}}) {
    final String? value = di.sl<SharedPreferencesOperator>().get(key, json.encode(defaultValue));
    return value != null ? json.decode(value) as Map<String, dynamic> : defaultValue;
  }

  /// Save a list of JSON values to the shared preferences.
  /// [key] is the key of the value to save.
  /// [value] is the value to save.
  /// Returns true if the value was saved successfully.
  /// Returns false if the value could not be saved.
  /// If the value could not be saved, the shared preferences may be out of space.
  /// In this case, use [remove] to free up space and retry.
  @override
  List<Map<String, dynamic>>? loadJsonList(String key, {List<Map<String, dynamic>>? defaultValue}) {
    final defaultList = defaultValue?.map((val) => json.encode(val)).toList();
    final List<String>? value = di.sl<SharedPreferencesOperator>().get(key, defaultList);
    return value != null ? value.map((val) => json.decode(val) as Map<String, dynamic>).toList() : defaultValue;
  }

  /// Set a JSON value in the shared preferences.
  /// [key] is the key for the value.
  /// [value] is the value to set.
  /// Returns true if the value was set.
  @override
  Future<bool> saveJson(String key, Map<String, dynamic> value) {
    return di.sl<SharedPreferencesOperator>().set(key, json.encode(value));
  }

  /// Set a list of JSON values in the shared preferences.
  /// [key] is the key for the value.
  /// [value] is the value to set.
  /// Returns true if the value was set.
  /// Returns false if the value could not be set.
  /// If the value could not be set, the shared preferences may be out of space.
  /// In this case, use [remove] to free up space and retry.
  @override
  Future<bool> saveJsonList(String key, List<Map<String, dynamic>> value) {
    return di.sl<SharedPreferencesOperator>().set(key, value.map((val) => json.encode(val)).toList());
  }

  /// Remove a value from the shared preferences.
  /// [key] is the key for the value.
  /// Returns true if the value was removed.
  @override
  Future<bool> remove(String key) {
    return di.sl<SharedPreferencesOperator>().remove(key);
  }

  /// Clear all values from the shared preferences.
  /// Returns true if the shared preferences were cleared.
  @override
  Future<bool> clear() {
    return di.sl<SharedPreferencesOperator>().clear();
  }

  /// Check if Shared Preferences contains a value for the given key.
  /// [key] is the key for the value.
  /// Returns true if the key is found.
  @override
  bool contains(String key) {
    return di.sl<SharedPreferencesOperator>().contains(key);
  }

  /// Set a value in the shared preferences.
  /// [key] is the key for the value.
  /// [value] is the value to set.
  /// [T] is the type of the value.
  /// [T] must be a supported type.
  /// Supported types are: bool, int, double, String, List<String>, and Map<String, dynamic>.
  /// If the value is not one of the supported types, the value will be ignored.
  /// If the value is null, the key will be removed from the shared preferences.
  /// If the value is not null, the key will be set to the value.
  /// Returns true if the value was set.
  @override
  Future<bool> save<T>(String key, T value) {
    return di.sl<SharedPreferencesOperator>().set(key, value);
  }

  /// Get a value from the shared preferences.
  /// [key] is the key for the value.
  /// [defaultValue] is the value to return if the key is not found.
  /// [T] is the type of the value.
  /// [T] must be a supported type.
  /// Supported types are: bool, int, double, String, List<String>, and Map<String, dynamic>.
  /// If the value is not one of the supported types, the default value will be returned.
  /// Returns the value for the given key or the default value if the key is not found.
  /// If the value is not one of the supported types, the default value will be returned.
  @override
  T load<T>(String key, T defaultValue) {
    return di.sl<SharedPreferencesOperator>().get(key, defaultValue);
  }
}
