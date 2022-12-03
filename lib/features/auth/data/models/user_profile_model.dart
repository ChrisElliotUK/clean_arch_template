import 'package:clean_arch_template/features/auth/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required int id,
    String firstName = '',
    String lastName = '',
    String email = '',
    bool subscription = false,
    String accessToken = '',
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          subscription: subscription,
          accessToken: accessToken,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      subscription: json['subscription'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'subscription': subscription,
      'accessToken': accessToken,
    };
  }

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      subscription: subscription,
      accessToken: accessToken,
    );
  }

  static UserProfileModel fromEntity(UserProfile entity) {
    return UserProfileModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      subscription: entity.subscription,
      accessToken: entity.accessToken,
    );
  }
}
