part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.user = UserProfile.empty,
    this.token = '',
    this.status = AuthStatus.UNKNOWN,
    this.isLoading = false,
  });

  final AuthStatus status;
  final UserProfile user;
  final String token;
  final bool isLoading;
  @override
  List<Object> get props => [
        status,
        user,
        token,
        isLoading,
      ];

  AuthState copyWith({
    AuthStatus? status,
    UserProfile? user,
    String? token,
    bool? isLoading,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
