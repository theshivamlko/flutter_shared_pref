import 'AppSharedPreference.dart';

// To use single instance of AppSharedPreference for SharedPreference usage
AppSharedPreference appSharedPreference;

/// Initialize value at start of app
void initialize() {
  appSharedPreference = AppSharedPreference();
}
