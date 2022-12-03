// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

class Env {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterConfig.loadEnvVariables();
  }

  static String? get(String key) {
    return FlutterConfig.get(key) as String?;
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
