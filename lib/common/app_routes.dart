import 'package:clean_arch_template/core/presentation/screens/splash_screen.dart';
import 'package:clean_arch_template/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      //! Core
      case SplashScreen.id:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      //! Home
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
