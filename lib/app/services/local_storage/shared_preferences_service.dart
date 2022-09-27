import 'dart:convert';

import 'package:heroi_da_vez/app/services/local_storage/i_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends ILocalStorageService {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesService._create(this._sharedPreferences);

  static Future<SharedPreferencesService> create() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var objectInstance = SharedPreferencesService._create(sharedPreferences);
    return objectInstance;
  }

  @override
  T? getValue<T>(LocalStorageKey key) {
    var storedItem = _sharedPreferences.getString(key.keyName);

    if (storedItem == null) {
      return null;
    }

    var decodedItem = jsonDecode(storedItem);
    return decodedItem as T;
  }

  @override
  void storeValue<T>(LocalStorageKey key, T? value) {
    _sharedPreferences.setString(key.keyName, jsonEncode(value));
  }
}
