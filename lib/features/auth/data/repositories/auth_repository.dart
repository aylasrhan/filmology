
import 'package:filmology/core/network/api_constans.dart';
import 'package:filmology/core/network/api_consumer.dart';
import 'package:filmology/core/services/auth_storage_service.dart';
import 'package:filmology/features/auth/data/model/auth_model.dart';

class AuthRepository {
  final ApiConsumer api;
  final AuthStorageService storage;

  AuthRepository(this.api, this.storage);

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );

      final authData = AuthModel.fromJson(response);

      if (authData.token != null && authData.token!.isNotEmpty) {
        await storage.saveToken(authData.token!);
      }

      if (authData.userData?.email != null) {
        await storage.saveUserEmail(authData.userData!.email!);
      }

      if (authData.userData?.name != null) {
        await storage.saveUserName(authData.userData!.name!);
        print("✅ User Name saved in Repository: ${authData.userData!.name}");
      }

      if (authData.userData?.id != null) {
        await storage.saveUserId(authData.userData!.id!);
      }

      return authData;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await api.post(
        EndPoints.register,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.passwordConfirmation: passwordConfirmation,
        },
      );

      final authData = AuthModel.fromJson(response);

      if (authData.token != null && authData.token!.isNotEmpty) {
        await storage.saveToken(authData.token!);
      }

      if (authData.userData?.email != null) {
        await storage.saveUserEmail(authData.userData!.email!);
      }

      if (authData.userData?.name != null) {
        await storage.saveUserName(authData.userData!.name!);
      }

      if (authData.userData?.id != null) {
        await storage.saveUserId(authData.userData!.id!);
      }

      return authData;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await api.post(EndPoints.logout);
    } finally {
      await storage.clearAllData(); 
    }
  }
}