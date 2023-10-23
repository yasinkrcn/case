// ignore_for_file: constant_identifier_names

enum SharedPreferencesKeys {
  CACHE_USER_TOKEN,
}

extension SharedPreferencesKeysExtension on SharedPreferencesKeys {
  String sharedKeyStateToKeyValues() {
    switch (this) {
      case SharedPreferencesKeys.CACHE_USER_TOKEN:
        return "CACHE_USER_INFO";
    }
  }
}
