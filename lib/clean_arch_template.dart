import 'package:clean_arch_template/common/app_routes.dart';
import 'package:clean_arch_template/core/presentation/screens/root.dart';
import 'package:clean_arch_template/core/presentation/screens/splash_screen.dart';
import 'package:clean_arch_template/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_template/di/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CleanArchTemplate extends StatefulWidget {
  const CleanArchTemplate({Key? key}) : super(key: key);

  @override
  _CleanArchTemplateState createState() => _CleanArchTemplateState();
}

class _CleanArchTemplateState extends State<CleanArchTemplate> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => di.sl<AuthCubit>()),
    ], child: const App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: ((context, child) => MaterialApp(
              title: 'Clean Arch Template',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: SplashScreen.id,
              navigatorKey: navigatorKey,
              onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
              builder: (context, child) => RootScreen(child: child!),
            )));
  }
}
