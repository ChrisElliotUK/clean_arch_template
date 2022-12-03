import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/delete_account.dart';
import '../../features/auth/domain/usecases/get_auth_token.dart';
import '../../features/auth/domain/usecases/get_user.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/send_password_reset_email.dart';
import '../../features/auth/domain/usecases/sign_up.dart';
import '../../features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/bloc/cubit/login_cubit.dart';
import '../injection_container.dart';

authFeature() {
  // Bloc
  sl.registerFactory(() => AuthCubit(
        signIn: sl(),
        signOut: sl(),
        deleteAccount: sl(),
        getAuthToken: sl(),
        sendPasswordResetEmail: sl(),
        getUser: sl(),
        signUp: sl(),
      ));
  sl.registerFactory(() => LoginCubit());

  // Use Cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => DeleteAccount(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => GetAuthToken(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SendPasswordResetEmail(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl(), sl()));
}
