enum Routes {
  loginPage("/", false),
  registerPage("/register", true),
  profilePage("/profile", true),
  incidentsPage("/incident/list", false),
  incidentDetail(
    "/incident/:incidentId",
    false,
    defaultRouteName: "/incident/",
  ),
  createIncident("/incident/add", false);

  final String routeName;
  final String? defaultRouteName;
  final bool authorized;

  const Routes(
    this.routeName,
    this.authorized, {
    this.defaultRouteName,
  });

  @override
  String toString() => routeName;
}
