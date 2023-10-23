import 'package:case_voco/src/core/utils/local_data_source/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance = SharedPreferencesManager._();

  factory SharedPreferencesManager() => _instance;

  SharedPreferencesManager._();

  // Verileri kaydet
  Future<void> write(SharedPreferencesKeys key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.sharedKeyStateToKeyValues(), value);
  }

  // Verileri oku
  Future<String?> read(SharedPreferencesKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.sharedKeyStateToKeyValues());
  }

  // Verileri sil
  Future<void> delete(SharedPreferencesKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.sharedKeyStateToKeyValues());
  }
}
