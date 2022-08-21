import 'package:heroi_da_vez/app/services/local_storage/i_local_storage_service.dart';

class SharedPreferencesService extends ILocalStorageService {
  @override
  T getValue<T>(LocalStorageKey key) {
    throw UnimplementedError();
  }

  @override
  void storeValue<T>(LocalStorageKey key, T value) {
    throw UnimplementedError();
  }
}
