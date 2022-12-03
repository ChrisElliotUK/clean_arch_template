import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final bool subscription;
  final String accessToken;

  const UserProfile({
    required this.id,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.subscription = false,
    this.accessToken = '',
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        subscription,
        accessToken,
      ];

  UserProfile copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? subscription,
    String? accessToken,
  }) {
    return UserProfile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      subscription: subscription ?? this.subscription,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  static const empty = UserProfile(id: 0);
}
