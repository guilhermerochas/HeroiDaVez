import 'package:heroi_da_vez/app/data/models/non_governmental_organization.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';

import '../local_storage/i_local_storage_service.dart';

class UserLoginService implements ILoginService<NonGovernamentalOrganization?> {
  final ILocalStorageService _localStorageService;

  const UserLoginService(this._localStorageService);

  @override
  void logoutUser() {
    _localStorageService.storeValue(LocalStorageKey.loggedUser, null);
  }

  @override
  void setCurrentUser(NonGovernamentalOrganization? user) {
    _localStorageService.storeValue(LocalStorageKey.loggedUser, user);
  }

  @override
  NonGovernamentalOrganization? getUser() {
    var user = _localStorageService.getValue(LocalStorageKey.loggedUser);
    return user;
  }
}
