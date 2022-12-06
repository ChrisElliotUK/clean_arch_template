import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static String id = '/auth_screen';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
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
