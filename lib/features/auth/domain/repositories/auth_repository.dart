import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_profile.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, bool>> cacheAuthToken(String token);
  Future<Either<Failure, String>> getCachedAuthToken();
  Future<Either<Failure, bool>> clearAuthToken();
  Future<Either<Failure, bool>> sendPasswordReset(String email);
  Future<Either<Failure, void>> clearSecureStorage();
  Future<Either<Failure, bool>> clearCache();
  Future<Either<Failure, bool>> deleteAccount();
  Future<Either<Failure, String>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  Future<Either<Failure, UserProfile>> getUser();
}
