import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static const _storage = FlutterSecureStorage();
  static const String _tokenKey = 'secure_access_token';

  /// Save token securely
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Get stored token
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  /// Delete stored token
  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  /// Migrate token from legacy storage (GetStorage) to SecureStorage if present
  static Future<void> migrateLegacyToken(
    dynamic appData,
    String legacyKey,
  ) async {
    try {
      final legacyToken = appData.read(legacyKey);
      if (legacyToken != null &&
          legacyToken is String &&
          legacyToken.isNotEmpty) {
        await saveToken(legacyToken);
        await appData.remove(legacyKey);
      }
    } catch (e) {
      // Ignore migration errors
    }
  }
}
