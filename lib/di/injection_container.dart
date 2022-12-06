import 'package:clean_arch_template/di/features/auth_feature.dart';
import 'package:clean_arch_template/di/features/core.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feautre - Auth
  authFeature();

  //! Core
  core();
}
