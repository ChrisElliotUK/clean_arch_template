import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class DeleteAccount implements UseCase<void, NoParams> {
  final AuthRepository repository;

  DeleteAccount(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.deleteAccount();
  }
}
