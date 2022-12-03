import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/revenuecat_repository.dart';

class CheckTrialOrIntroductoryPriceEligibility implements UseCase<Map<String, IntroEligibility>, CanMakePaymentsParams> {
  final RevenuecatRepository repository;

  CheckTrialOrIntroductoryPriceEligibility(this.repository);

  @override
  Future<Either<Failure, Map<String, IntroEligibility>>> call(CanMakePaymentsParams params) async {
    return await repository.checkTrialOrIntroductoryPriceEligibility(params.productIdentifiers);
  }
}

class CanMakePaymentsParams extends Equatable {
  const CanMakePaymentsParams({required this.productIdentifiers});

  final List<String> productIdentifiers;

  @override
  List<Object> get props => [productIdentifiers];
}
