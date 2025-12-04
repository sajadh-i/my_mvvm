import 'package:my_mvvm/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _userKey = "USER_DATA";

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userToJson(user));
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);

    if (jsonString == null) return null;

    return userFromJson(jsonString);
  }

  Future<bool> isLoggedIn() async {
    final user = await getUser();
    return user?.access != null;
  }

  /// ✅ Get Access Token
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);

    if (jsonString == null) return null;

    final user = userFromJson(jsonString);
    return user.access;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
