import 'dart:async';
import 'package:clean_arch_template/core/error/dio_error_handler.dart';
import 'package:clean_arch_template/features/auth/domain/entities/user_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

enum AuthStatus {
  AUTHENTICATED,
  UNAUTHENTICATED,
  ONBOARDING,
  UNKNOWN,
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final _controller = StreamController<AuthStatus>();

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, bool>> cacheAuthToken(String token) async {
    try {
      final result = await _localDataSource.cacheAuthToken(token);

      return Right(result);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getCachedAuthToken() async {
    try {
      final result = await _localDataSource.getCachedAuthToken();
      if (result == 'ERROR') {
        return const Left(CacheFailure(errorMessage: 'No token found'));
      }
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final result = await _remoteDataSource.signIn(email, password);

      await cacheAuthToken(result);
      _controller.add(AuthStatus.AUTHENTICATED);
      return Right(result);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return const Left(ApiFailure(errorMessage: 'Connection timed out'));
      } else {
        return Left(ApiFailure(errorMessage: dioErrorHandler(e)));
      }
    } catch (e) {
      return Left(ApiFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await _remoteDataSource.signOut();
      await clearSecureStorage();
      await clearCache();
      _controller.add(AuthStatus.UNAUTHENTICATED);
      return const Right(true);
    } on DioError catch (e) {
      return Left(ApiFailure(errorMessage: dioErrorHandler(e)));
    } catch (e) {
      return Left(ApiFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> clearAuthToken() async {
    try {
      final result = await _localDataSource.clearAuthToken();

      return Right(result);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendPasswordReset(String email) async {
    try {
      final result = await _remoteDataSource.sendPasswordReset(email);

      return Right(result);
    } on DioError catch (e) {
      return Left(ApiFailure(errorMessage: dioErrorHandler(e)));
    } catch (e) {
      return Left(ApiFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearSecureStorage() async {
    try {
      final result = await _localDataSource.clearSecureStorage();

      return Right(result);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> clearCache() async {
    try {
      final result = await _localDataSource.clearCache();

      return Right(result);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAccount() async {
    try {
      final result = await _remoteDataSource.deleteAccount();
      await clearSecureStorage();
      await clearCache();
      return Right(result);
    } on DioError catch (e) {
      return Left(ApiFailure(errorMessage: dioErrorHandler(e)));
    } catch (e) {
      return Left(ApiFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final result =
          await _remoteDataSource.signUp(email: email, password: password, firstName: firstName, lastName: lastName);

      await cacheAuthToken(result);

      return Right(result);
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) {
        return const Left(ApiFailure(errorMessage: 'Email already exists'));
      }
      if (e.response?.statusCode == 404 && e.message.contains('Club Not Found')) {
        return const Left(ApiFailure(errorMessage: 'Club Not Found'));
      } else {
        return Left(ApiFailure(errorMessage: dioErrorHandler(e)));
      }
    } catch (e) {
      return Left(ApiFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getUser() async {
    try {
      final result = await _remoteDataSource.getUser();

      return Right(result);
    } on DioError catch (e) {
      return Left(ApiFailure(errorMessage: dioErrorHandler(e)));
    } catch (e) {
      return Left(ApiFailure(errorMessage: e.toString()));
    }
  }
}
