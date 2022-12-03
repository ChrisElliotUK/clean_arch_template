import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/injection_container.dart' as di;

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static String id = '/Auth';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: const _AuthScreenBody(),
    );
  }
}

class _AuthScreenBody extends StatelessWidget {
  const _AuthScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
