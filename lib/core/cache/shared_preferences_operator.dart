import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesOperator {
  SharedPreferencesOperator(this._preferences);

  final SharedPreferences _preferences;

  SharedPreferences get preferences => _preferences;

  /// Get a value from the shared preferences.
  /// [key] is the key of the value to get.
  /// [defaultValue] is the value to return if the key is not found.
  /// [T] is the type of the value to get.
  /// Returns the value for the given key or the default value if the key is not found.
  T get<T>(String key, T defaultValue) {
    return _preferences.get(key) as T? ?? defaultValue;
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
  Future<bool> set<T>(String key, T value) async {
    if (value is String) {
      return _preferences.setString(key, value);
    } else if (value is bool) {
      return _preferences.setBool(key, value);
    } else if (value is int) {
      return _preferences.setInt(key, value);
    } else if (value is double) {
      return _preferences.setDouble(key, value);
    } else if (value is List<String>) {
      return _preferences.setStringList(key, value);
    } else if (value is Map<String, dynamic>) {
      return _preferences.setString(key, value.toString());
    }
    return false;
  }

  /// Remove a value from the shared preferences.
  /// [key] is the key for the value.
  /// Returns true if the value was removed.
  /// Returns false if the key was not found.
  /// Throws an exception if the value is not one of the supported types.
  /// Supported types are: bool, int, double, String, List<String>, and Map<String, dynamic>.
  /// If the value is not one of the supported types, the value will be ignored.
  /// If the value is null, the key will be removed from the shared preferences.
  /// If the value is not null, the key will be set to the value.
  Future<bool> remove(String key) async {
    return _preferences.remove(key);
  }

  /// Clear all values from the shared preferences.
  /// Returns true if the shared preferences were cleared.
  /// Returns false if the shared preferences were not cleared.
  Future<bool> clear() async {
    return _preferences.clear();
  }

  /// Check if the shared preferences contains a value for the given key.
  /// [key] is the key for the value.
  /// Returns true if the shared preferences contains a value for the given key.
  /// Returns false if the shared preferences does not contain a value for the given key.
  bool contains(String key) {
    return _preferences.containsKey(key);
  }
}
