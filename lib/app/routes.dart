import 'package:go_router/go_router.dart';
import 'package:heroi_da_vez/app/pages/create_incident/create_incident.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/incident_detail.dart';
import 'package:heroi_da_vez/app/pages/incidents/incidents.dart';
import 'package:heroi_da_vez/app/pages/login/login.dart';
import 'package:heroi_da_vez/app/pages/profile/profile.dart';
import 'package:heroi_da_vez/app/pages/register/register.dart';

enum Routes {
  loginPage("/"),
  registerPage("/register"),
  profilePage("/profile"),
  incidentsPage("/incident/list"),
  incidentDetail("/incident/:incidentId"),
  createIncident("/incident/add");

  final String routeName;

  const Routes(this.routeName);
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.loginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.profilePage.routeName,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: Routes.registerPage.routeName,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.incidentsPage.routeName,
      builder: (context, state) => const IncidentsPage(),
    ),
    GoRoute(
      path: Routes.incidentDetail.routeName,
      builder: (context, state) => IncidentDetailPage(
        incidentId: state.params["incidentId"] as int,
      ),
    ),
    GoRoute(
      path: Routes.createIncident.routeName,
      builder: (context, state) => const CreateIncidentPage(),
    )
  ],
);
