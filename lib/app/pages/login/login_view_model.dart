import 'package:flutter/foundation.dart';
import 'package:heroi_da_vez/app/components/text_input_component.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';

import '../../data/models/non_governmental_organization.dart';

class LoginViewModel extends ChangeNotifier {
  final IDatabase database;
  final ILoginService<NonGovernamentalOrganization?> _loginService;

  final TextInputComponent _heroId = TextInputComponent(
    validator: (input) => input.errorMessage == null && input.text.length == 6,
  );

  TextInputComponent get heroId => _heroId;

  LoginViewModel(this.database, this._loginService);

  void setHeroId(String value) {
    _heroId.text = value;
    handleValidateHeroId(value);
    notifyListeners();
  }

  bool handleIsLoginValid() {
    if (!_heroId.isValid()) {
      return false;
    }

    var iterableOngValue = database.nonGovernamentalOrganization
        .getAll()
        .where((element) => element.loginCode == _heroId.text);

    if (iterableOngValue.isEmpty) {
      return false;
    }

    _loginService.setCurrentUser(iterableOngValue.first);

    return true;
  }

  void handleValidateHeroId(String? value) {
    if (value == null || value.length != 6) {
      _heroId.errorMessage = "Preencha o campo de Id!";
      return;
    }

    _heroId.errorMessage = null;
  }
}
