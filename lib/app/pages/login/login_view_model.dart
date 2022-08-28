import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/components/text_input_component.dart';
import 'package:heroi_da_vez/app/routes.dart';

class LoginViewModel extends ChangeNotifier {
  final FocusNode _focusNode = FocusNode();
  final TextInputComponent _heroId = TextInputComponent();

  FocusNode get focusNode => _focusNode;

  TextInputComponent get heroId => _heroId;

  void setHeroId(String? value) {
    if (value == null || value.trim().isEmpty) {
      _heroId.errorMessage = "valor não pode ser vazio!";
      notifyListeners();
      return;
    }

    if (value.length <= 4) {
      _heroId.errorMessage = "Id muito curto";
      notifyListeners();
      return;
    }

    _heroId.errorMessage = null;
    _heroId.text = value;
    notifyListeners();
  }

  void handleOnLogin() {
    if (!_heroId.isValid()) {
      return;
    }

    focusNode.unfocus();
    router.push(Routes.incidentsPage.toString());
    notifyListeners();
  }
}
