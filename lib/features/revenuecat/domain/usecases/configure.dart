import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/revenuecat_repository.dart';

class Configure implements UseCase<void, ConfigureParams> {
  final RevenuecatRepository repository;

  Configure(this.repository);

  @override
  Future<Either<Failure, void>> call(ConfigureParams params) async {
    return await repository.configure(params.purchasesConfig);
  }
}

class ConfigureParams extends Equatable {
  const ConfigureParams({required this.purchasesConfig});

  final PurchasesConfiguration purchasesConfig;

  @override
  List<Object?> get props => [purchasesConfig];
}
