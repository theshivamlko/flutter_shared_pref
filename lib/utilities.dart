import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;

void initialize() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

void saveData(String key, dynamic value) {
  if (value is String) sharedPreferences.setString(key, value);
  if (value is int) sharedPreferences.setInt(key, value);
  if (value is bool) sharedPreferences.setBool(key, value);
}

dynamic getSaveData(String key) {
  return sharedPreferences.get(key);
}
