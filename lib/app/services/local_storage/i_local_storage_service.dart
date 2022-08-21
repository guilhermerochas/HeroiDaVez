enum LocalStorageKey {
  loggedUser("USUARIO_LOGADO");

  final String keyName;
  const LocalStorageKey(this.keyName);
}

abstract class ILocalStorageService {
  T getValue<T>(LocalStorageKey key);
  void storeValue<T>(LocalStorageKey key, T value);
}
