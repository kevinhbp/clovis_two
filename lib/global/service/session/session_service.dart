import 'package:get_storage/get_storage.dart';

class SessionService {
  factory SessionService() => _instance;

  SessionService.internal();

  static final SessionService _instance = SessionService.internal();

  final _box = GetStorage();

  // region TOKEN

  final _keyToken = 'token';
  
  Future<void> setToken(String? token) => _box.write(_keyToken, token);

  String? getToken() => _box.read(_keyToken);

  // endregion
}