import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/revenuecat_repository.dart';

class AddCustomerInfoUpdateListener extends UseCase<void, AddCustomerInfoUpdateListenerParams> {
  final RevenuecatRepository repository;

  AddCustomerInfoUpdateListener(this.repository);

  @override
  Future<Either<Failure, void>> call(AddCustomerInfoUpdateListenerParams params) async {
    return await repository.addCustomerInfoUpdateListener(params.listener);
  }
}

class AddCustomerInfoUpdateListenerParams extends Equatable {
  const AddCustomerInfoUpdateListenerParams({required this.listener});

  final void Function(CustomerInfo) listener;

  @override
  List<Object?> get props => [listener];
}
