// ignore_for_file: non_constant_identifier_names

part of 'api_client.dart';

final Dio dioClient = Dio(BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 20000,
  sendTimeout: 20000,
  receiveTimeout: 20000,
));

//! Core
String baseUrl = Env.get(EnvVariable.API_BASE_URL) ?? '';
CancelToken defaultCancelToken = CancelToken();

//! Auth
String SIGN_IN = '/auth/login';
String SIGN_UP = '/auth/account-create';
String SIGN_OUT = '/auth/logout';
String PASSWORD_RESET = '/auth/password-reset';
String DELETE_ACCOUNT = '/auth/delete';
String GET_USER_PROFILE = '/auth/user';
