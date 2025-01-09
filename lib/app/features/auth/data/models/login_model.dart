import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "expiresOn")
  final DateTime expiresOn;
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "user")
  final User user;
  @JsonKey(name: "userId")
  final String userId;

  LoginModel({
    required this.expiresOn,
    required this.token,
    required this.user,
    required this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "role")
  final List<String> role;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
