import 'package:clean_arch_template/clean_arch_template.dart';
import 'package:clean_arch_template/core/services/env.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_template/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();

  await di.init();
  runApp(const CleanArchTemplate());
}
