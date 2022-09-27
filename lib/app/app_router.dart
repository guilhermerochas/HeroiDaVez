import 'package:go_router/go_router.dart';
import 'package:heroi_da_vez/app/pages/create_incident/create_incident.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/incident_detail.dart';
import 'package:heroi_da_vez/app/pages/incidents/incidents.dart';
import 'package:heroi_da_vez/app/pages/login/login.dart';
import 'package:heroi_da_vez/app/pages/profile/profile.dart';
import 'package:heroi_da_vez/app/pages/register/register.dart';
import 'package:heroi_da_vez/app/routes.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';

class AppRouter {
  final ILoginService _loginService;

  AppRouter(this._loginService);

  late final GoRouter _router = GoRouter(
    refreshListenable: _loginService,
    routes: [
      GoRoute(
        name: Routes.loginPage.routeName,
        path: Routes.loginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: Routes.profilePage.routeName,
        path: Routes.profilePage.routeName,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        name: Routes.registerPage.routeName,
        path: Routes.registerPage.routeName,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        name: Routes.incidentsPage.routeName,
        path: Routes.incidentsPage.routeName,
        builder: (context, state) => IncidentsPage(),
      ),
      GoRoute(
        name: Routes.incidentDetail.routeName,
        path: Routes.incidentDetail.routeName,
        builder: (context, state) => IncidentDetailPage(
          incidentId: int.parse(state.params["incidentId"] as String),
        ),
      ),
      GoRoute(
        name: Routes.createIncident.routeName,
        path: Routes.createIncident.routeName,
        builder: (context, state) => const CreateIncidentPage(),
      )
    ],
  );

  GoRouter get router => _router;
}
