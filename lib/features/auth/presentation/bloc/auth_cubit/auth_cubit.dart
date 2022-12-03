import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../domain/entities/user_profile.dart';
import '../../../domain/usecases/delete_account.dart';
import '../../../domain/usecases/get_auth_token.dart';
import '../../../domain/usecases/get_user.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/logout.dart';
import '../../../domain/usecases/send_password_reset_email.dart';
import '../../../domain/usecases/sign_up.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required Login signIn,
      required Logout signOut,
      required DeleteAccount deleteAccount,
      required GetAuthToken getAuthToken,
      required GetUser getUser,
      required SignUp signUp,
      required SendPasswordResetEmail sendPasswordResetEmail})
      : _signIn = signIn,
        _signOut = signOut,
        _deleteAccount = deleteAccount,
        _getAuthToken = getAuthToken,
        _getUser = getUser,
        _signUp = signUp,
        _sendPasswordResetEmail = sendPasswordResetEmail,
        super(const AuthState());

  final Login _signIn;
  final Logout _signOut;
  final DeleteAccount _deleteAccount;
  final GetAuthToken _getAuthToken;
  final GetUser _getUser;
  final SignUp _signUp;
  final SendPasswordResetEmail _sendPasswordResetEmail;

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    final result = await _signIn(SignInParams(email: email, password: password));

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, status: AuthStatus.UNAUTHENTICATED)),
      (success) => emit(state.copyWith(isLoading: false, token: success)),
    );
  }

  Future<void> getAuthToken() async {
    emit(state.copyWith(isLoading: true));

    final result = await _getAuthToken(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, status: AuthStatus.UNAUTHENTICATED)),
      (success) => emit(state.copyWith(isLoading: false, token: success)),
    );
  }

  Future<void> getUser() async {
    emit(state.copyWith(isLoading: true));

    final result = await _getUser(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, status: AuthStatus.UNAUTHENTICATED)),
      (success) => emit(state.copyWith(isLoading: false, user: success, status: AuthStatus.AUTHENTICATED)),
    );
  }

  Future<void> signUp(String email, String password, String firstName, String lastName) async {
    emit(state.copyWith(isLoading: true));
    final result = await _signUp(SignUpParams(email: email, password: password, firstName: firstName, lastName: lastName));

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, status: AuthStatus.UNAUTHENTICATED)),
      (success) => emit(state.copyWith(isLoading: false, token: success)),
    );
  }

  Future<void> sendPasswordResetEmail(String email) async {
    emit(state.copyWith(isLoading: true));
    final result = await _sendPasswordResetEmail(SendPasswordResetParams(email: email));

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (success) => emit(state.copyWith(isLoading: false)),
    );
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true));
    final result = await _signOut(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (success) => emit(state.copyWith(isLoading: false, status: AuthStatus.UNAUTHENTICATED)),
    );
  }

  Future<void> deleteAccount() async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteAccount(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (success) => emit(state.copyWith(isLoading: false, status: AuthStatus.UNAUTHENTICATED)),
    );
  }
}
