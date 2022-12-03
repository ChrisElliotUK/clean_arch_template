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
String SIGN_IN = '/auth/login-factor1';
String SIGN_UP = '/auth/account-create';
String SIGN_OUT = '/auth/logout';
String PASSWORD_RESET = '/auth/password-reset1';
String DELETE_ACCOUNT = '/user/me/delete';

//! Feature - Train
String GET_SESSIONS = '/training/sessions';
String SEND_SESSION_TO_THIRD_PARTY = "/vendors/send-session/";
String GET_THIRD_PARTY_SESSIONS = "/vendors/matching-sessions/";
String GET_THIRD_PARTY_INTERVALS = "/vendors/matching-intervals-without-merging/";
String EDIT_SESSION = "/training/session/";

//! Feature - Plan
String CREATE_PLAN = '/training/startplan';
String UPDATE_PLAN = '/training/plan';
String GET_PLAN = '/training/plan';
String GET_TRAINING_PHASE = '/training/phases';
String GET_WEEKLY_DISTANCE = '/training/weekly-distance';
String GET_AVG_RUN_DISTANCE = '/training/average-run-distance';
String GET_CURRENT_PLAN_TRAINING_DAYS = '/training/training-days';

//! Feature - Third Party Apps
String VERIFY_OAUTH = '/oauth/verify';
String CONNECT_TO_OAUTH = '/oauth/connect';
String GET_TERRA_TOKEN = '/vendors/generate-terra-auth-token';
String CONNECT_STRAVA = '/vendors/connect-provider';
String CHECK_GARMIN_CONNECTION = '/oauth/garmin-connected';
String CHECK_STRAVA_CONNECTION = '/vendors/strava-connected';
String DISCONNECT_STRAVA = '/vendors/strava-disconnect';
String DISCONNECT_GARMIN = '/oauth/disconnect';
String CHECK_TERRA_CONNECTION = '/vendors/terra-connected';
String DISCONNECT_TERRA = '/vendors/terra-disconnect';

//! Feature - Streak
///{{BASE_URL}}/api/streak/me?dateFrom=2022-07-13&dateTo=2022-07-24
String GET_STREAK = '/streak/me';

//! Feature - Progress
String GET_PROGRESS = '/training/progress';

///{{BASE_URL}}/api/training/sessions/progress?fromDate=2022-01-28&toDate=2022-08-31&interval=week
String GET_COMPLETED_SESSION_PERCENTAGE = '/training/sessions/progress';

///{{BASE_URL}}/api/training/threshold?fromDate=2022-07-01&toDate=2022-08-30&interval=week
String GET_THRESHOLD_PACE_HISTORY = '/training/threshold';

//! Feature - Profile
String GET_USER_PROFILE = '/user/me';
String UPDATE_USER_PROFILE = '/user/me';
String GET_AVATAR = '/user/me/avatar';
String UPDATE_AVATAR = '/user/me/avatar';

//! Feature - Rewards
String GET_REWARDS = '/reward/list';
