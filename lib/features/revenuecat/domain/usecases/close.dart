import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/revenuecat_repository.dart';

class Close implements UseCase<void, NoParams> {
  final RevenuecatRepository repository;

  Close(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.close();
  }
}
