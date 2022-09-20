import 'package:flutter/cupertino.dart';

abstract class ILoginService<T> extends ChangeNotifier {
  T getUser();
  void setCurrentUser(T user);
  void logoutUser();
  bool get isUserLoggedIn;
}
