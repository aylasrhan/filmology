
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/api_constans.dart';

class AuthStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> saveToken(String token) async {
    await _storage.write(key: ApiKeys.token, value: token);
    print("✅ Token saved successfully: $token");
  }

  Future<String?> getToken() async {
    return await _storage.read(key: ApiKeys.token);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: ApiKeys.token);
  }

  Future<bool> hasToken() async {
    String? token = await getToken();
    return token != null && token.isNotEmpty;
  }
  Future<void> saveUserId(int userId) async {
    await _storage.write(key: 'user_id', value: userId.toString());
  }

  Future<int?> getUserId() async {
    String? id = await _storage.read(key: 'user_id');
    return id != null ? int.parse(id) : null;
  }
  Future<void> saveUserEmail(String email) async {
    await _storage.write(key: 'user_email', value: email);
    print("✅ Email saved successfully: $email");
  }

  Future<String?> getUserEmail() async {
    return await _storage.read(key: 'user_email');
  }

  Future<void> deleteUserEmail() async {
    await _storage.delete(key: 'user_email');
  }

  Future<void> saveUserName(String name) async {
    await _storage.write(key: 'user_name', value: name);
    print("✅ Username saved successfully: $name");
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: 'user_name');
  }

  Future<void> deleteUserName() async {
    await _storage.delete(key: 'user_name');
  }

  Future<void> clearAllData() async {
    await deleteToken();
    await deleteUserEmail();
    await deleteUserName();
    await _storage.delete(key: 'user_id');
    print("🗑️ All user data cleared from storage");
  }
}