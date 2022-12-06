import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RevenuecatScreen extends StatelessWidget {
  const RevenuecatScreen({Key? key}) : super(key: key);
  static String id = '/Revenuecat';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: const _RevenuecatScreenBody(),
    );
  }
}

class _RevenuecatScreenBody extends StatelessWidget {
  const _RevenuecatScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
