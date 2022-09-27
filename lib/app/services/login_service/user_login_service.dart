import 'package:flutter/cupertino.dart';
import 'package:heroi_da_vez/app/data/models/non_governmental_organization.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';

import '../local_storage/i_local_storage_service.dart';

class UserLoginService extends ChangeNotifier
    implements ILoginService<NonGovernamentalOrganization?> {
  final ILocalStorageService _localStorageService;

  UserLoginService(this._localStorageService);

  @override
  void logoutUser() {
    _localStorageService.storeValue(LocalStorageKey.loggedUser, null);
    notifyListeners();
  }

  @override
  void setCurrentUser(NonGovernamentalOrganization? user) {
    _localStorageService.storeValue(LocalStorageKey.loggedUser, user);
    notifyListeners();
  }

  @override
  NonGovernamentalOrganization? getUser() {
    var user = _localStorageService.getValue(LocalStorageKey.loggedUser);
    return NonGovernamentalOrganization?.fromJson(user);
  }

  @override
  bool get isUserLoggedIn =>
      _localStorageService.getValue(LocalStorageKey.loggedUser) != null;
}
