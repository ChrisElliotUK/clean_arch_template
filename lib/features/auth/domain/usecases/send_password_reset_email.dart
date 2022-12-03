import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SendPasswordResetEmail implements UseCase<bool, SendPasswordResetParams> {
  final AuthRepository repository;

  SendPasswordResetEmail(this.repository);

  @override
  Future<Either<Failure, bool>> call(SendPasswordResetParams params) async {
    return await repository.sendPasswordReset(params.email);
  }
}

class SendPasswordResetParams extends Equatable {
  final String email;

  const SendPasswordResetParams({required this.email});

  @override
  List<Object> get props => [email];
}
