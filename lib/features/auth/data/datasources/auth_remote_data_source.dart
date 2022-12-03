import 'package:clean_arch_template/features/auth/domain/entities/user_profile.dart';
import 'package:clock/clock.dart';

import '../../../../api/api_client.dart';
import '../models/user_profile_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> signIn(String email, String password);
  Future<void> signOut();
  Future<bool> sendPasswordReset(String email);
  Future<bool> deleteAccount();
  Future<String> signUp(
      {required String email, required String password, required String firstName, required String lastName});
  Future<UserProfile> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _client;

  const AuthRemoteDataSourceImpl(this._client);
  @override
  Future<String> signIn(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final result = await _client.post(SIGN_IN, data: data);

    return result.data;
  }

  @override
  Future<void> signOut() async {
    await _client.post(SIGN_OUT);
  }

  @override
  Future<bool> sendPasswordReset(String email) async {
    final data = {
      'email': email,
    };

    final result = await _client.post(PASSWORD_RESET, data: data);

    return result.data;
  }

  @override
  Future<bool> deleteAccount() async {
    final result = await _client.delete(DELETE_ACCOUNT);

    return result.data;
  }

  @override
  Future<String> signUp(
      {required String email, required String password, required String firstName, required String lastName}) async {
    final data = {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'startDate': clock.now().toIso8601String(),
      'reminderNotification': true,
    };

    final result = await _client.post(SIGN_UP, data: data);

    return result.data;
  }

  @override
  Future<UserProfile> getUser() async {
    final result = await _client.get(GET_USER_PROFILE);

    return UserProfileModel.fromJson(result.data);
  }
}
