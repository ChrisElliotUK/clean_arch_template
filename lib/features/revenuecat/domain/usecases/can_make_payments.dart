import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/revenuecat_repository.dart';

class CanMakePayments implements UseCase<bool, CanMakePaymentsParams> {
  final RevenuecatRepository repository;

  CanMakePayments(this.repository);

  @override
  Future<Either<Failure, bool>> call(CanMakePaymentsParams params) async {
    return await repository.canMakePayments(params.features);
  }
}

class CanMakePaymentsParams extends Equatable {
  const CanMakePaymentsParams({required this.features});

  final List<BillingFeature> features;

  @override
  List<Object> get props => [features];
}
