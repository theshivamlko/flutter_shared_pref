import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static SharedPreferences sharedPreferences;

  AppSharedPreference() {
    getInstance();
  }

  void getInstance() async {
    if (sharedPreferences == null)
      sharedPreferences = await SharedPreferences.getInstance();

    print(sharedPreferences);
  }

  void saveData(String key, dynamic value) {
    if (value is String) sharedPreferences.setString(key, value);
    if (value is int) sharedPreferences.setInt(key, value);
    if (value is bool) sharedPreferences.setBool(key, value);
  }

  dynamic getSaveData(String key) {
    return sharedPreferences.get(key);
  }
}
