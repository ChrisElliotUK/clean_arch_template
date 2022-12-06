import 'package:clean_arch_template/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_template/features/auth/presentation/bloc/cubit/login_cubit.dart';
import 'package:clean_arch_template/features/nested_navigation/presentation/screens/first_screen.dart';
import 'package:clean_arch_template/features/nested_navigation/presentation/widgets/bottom_sheet_nested_navigator.dart';
import 'package:clean_arch_template/features/nested_navigation/presentation/widgets/custom_bottom_sheet.dart';
import 'package:clean_arch_template/features/nested_navigation/presentation/widgets/drag_down_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyBottomSheet extends StatelessWidget {
  static const String id = '/MyBottomSheet';
  const MyBottomSheet({Key? key, required this.authCubit}) : super(key: key);

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(value: authCubit),
      BlocProvider(create: (context) => LoginCubit()),
    ], child: const _MyBottomSheetBody());
  }
}

class _MyBottomSheetBody extends StatelessWidget {
  const _MyBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      const DragDownIndicator(),
      Expanded(
          child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              controller: ModalScrollController.of(context),
              slivers: const <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: BottomSheetNestedNavigator(child: FirstScreen()),
            )
          ]))
    ]));
  }
}
