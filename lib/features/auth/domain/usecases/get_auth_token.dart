import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class GetAuthToken implements UseCase<String, NoParams> {
  final AuthRepository repository;

  GetAuthToken(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getCachedAuthToken();
  }
}
