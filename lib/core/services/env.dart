import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static String? get(String key) {
    return dotenv.env[key];
  }
}

class EnvVariable {
  //! Core
  static const String ENV = "ENV";
  static const String API_BASE_URL = "API_BASE_URL";

  //! Revenuecat
  static const String REVENUECAT_APPLE_SDK_KEY = "REVENUECAT_APPLE_SDK_KEY";
  static const String REVENUECAT_ANDROID_SDK_KEY = "REVENUECAT_ANDROID_SDK_KEY";
}
