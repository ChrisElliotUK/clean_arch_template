import 'package:clean_arch_template/clean_arch_template.dart';
import 'package:clean_arch_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_arch_template/features/auth/domain/entities/user_profile.dart';
import 'package:clean_arch_template/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:clean_arch_template/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key, required this.child}) : super(key: key);

  static const String id = '/root_screen';
  final Widget child;
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().getAuthToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.AUTHENTICATED:
            navigatorKey.currentState!.pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
            break;
          case AuthStatus.UNAUTHENTICATED:
            context.read<AuthCubit>().setUser(UserProfile.empty);
            navigatorKey.currentState!.pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
            break;
          case AuthStatus.UNKNOWN:
            break;
          case AuthStatus.ONBOARDING:
            navigatorKey.currentState!.pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);

            break;
        }
      },
      child: widget.child,
    );
  }
}
