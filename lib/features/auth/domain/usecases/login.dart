import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class Login implements UseCase<String, SignInParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, String>> call(SignInParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class SignInParams extends Equatable {
  const SignInParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
