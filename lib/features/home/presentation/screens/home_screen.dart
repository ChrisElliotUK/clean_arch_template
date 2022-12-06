import 'package:clean_arch_template/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_template/features/nested_navigation/presentation/screens/my_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../di/injection_container.dart' as di;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return const _HomeScreenBody();
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          Center(
              child: ElevatedButton(
                  onPressed: () => openBottomSheet(context, context.read<AuthCubit>()),
                  child: const Text("Open Bottom Sheet")))
        ],
      ),
    );
  }
}

void openBottomSheet(BuildContext context, AuthCubit authCubit) {
  showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      context: context,
      builder: (context) => MyBottomSheet(authCubit: authCubit));
}
