abstract class ILoginService<T> {
  T getUser();
  void setCurrentUser(T user);
  void logoutUser();
}
