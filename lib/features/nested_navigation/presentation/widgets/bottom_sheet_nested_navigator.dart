import 'package:clean_arch_template/features/nested_navigation/presentation/screens/first_screen.dart';
import 'package:clean_arch_template/features/nested_navigation/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class BottomSheetNestedNavigator extends StatelessWidget {
  const BottomSheetNestedNavigator({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => BottomSheetRoutes.generateRoute(settings),
      onGenerateInitialRoutes: (navigator, initialRoute) {
        return [MaterialPageRoute(builder: (context) => child)];
      },
    );
  }
}

class BottomSheetRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FirstScreen.id:
        return MaterialPageRoute(builder: (context) => const FirstScreen());
      case SecondScreen.id:
        return MaterialPageRoute(builder: (_) => const SecondScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Error}'))));
  }
}
