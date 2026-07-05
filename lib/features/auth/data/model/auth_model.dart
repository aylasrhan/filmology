
import 'package:filmology/core/network/api_constans.dart';

class AuthModel {
  final String? message;
  final String? token;
  final UserData? userData;

  AuthModel({this.message, this.token, this.userData});

  factory AuthModel.fromJson(dynamic json) {
    Map<String, dynamic> data;

    if (json is List && json.isNotEmpty) {
      data = json[0] as Map<String, dynamic>;
    } else if (json is Map<String, dynamic>) {
      data = json;
    } else {
      return AuthModel(message: "Unknown Format");
    }

    final String? msg = data[ApiKeys.message]?.toString();

    final nestedData = data[ApiKeys.data];
    String? token;
    if (nestedData is Map) {
      token = nestedData[ApiKeys.token]?.toString();
    }
    token ??= data[ApiKeys.token]?.toString();

    UserData? user;
    if (nestedData is Map) {
      user = UserData.fromJson(nestedData as Map<String, dynamic>);
    } else {
      user = UserData.fromJson(data);
    }

    return AuthModel(
      message: msg,
      token: token,
      userData: user,
    );
  }
}

class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? role;

  UserData({this.id, this.name, this.email, this.role});

  factory UserData.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> target = (json[ApiKeys.user] is Map<String, dynamic>) 
        ? json[ApiKeys.user] 
        : json;

    return UserData(
      id: int.tryParse(target[ApiKeys.id]?.toString() ?? ''),
      name: target[ApiKeys.name]?.toString(), 
      email: target[ApiKeys.email]?.toString(),
      role: target['role']?.toString(),
    );
  }
}