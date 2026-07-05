import 'package:filmology/features/auth/data/model/auth_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserData user;
  ProfileSuccess(this.user);
}

class ProfileError extends ProfileState {
  final String errMessage;
  ProfileError(this.errMessage);
}