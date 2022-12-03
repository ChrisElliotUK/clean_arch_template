import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_profile.dart';
import '../repositories/auth_repository.dart';

class GetUser implements UseCase<UserProfile, NoParams> {
  final AuthRepository repository;

  GetUser(this.repository);
  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) async {
    return await repository.getUser();
  }
}
