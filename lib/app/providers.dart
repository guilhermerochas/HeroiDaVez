import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroi_da_vez/app/app_router.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/incident_detail_view_model.dart';
import 'package:heroi_da_vez/app/pages/incidents/incidents_view_model.dart';
import 'package:heroi_da_vez/app/pages/login/login_view_model.dart';
import 'package:heroi_da_vez/app/services/local_storage/i_local_storage_service.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';
import 'package:provider/provider.dart';

import 'data/models/non_governmental_organization.dart';

class MultiProviderContext extends StatelessWidget {
  final IDatabase database;
  final ILoginService<NonGovernamentalOrganization?> loginService;
  final ILocalStorageService localStorageService;
  final Widget Function(GoRouter router) widget;

  const MultiProviderContext({
    Key? key,
    required this.widget,
    required this.database,
    required this.loginService,
    required this.localStorageService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ILocalStorageService>(create: (_) => localStorageService),
        ChangeNotifierProvider<ILoginService<NonGovernamentalOrganization?>>(
          create: (_) => loginService,
        ),
        Provider<AppRouter>(
          create: (_) => AppRouter(loginService),
        ),
        Provider<IDatabase>(create: (_) => database),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(
            Provider.of<IDatabase>(context, listen: false),
            Provider.of<ILoginService<NonGovernamentalOrganization?>>(
              context,
              listen: false,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => IncidentsPageViewModel(
            Provider.of<IDatabase>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => IncidentDetailViewModel(
            Provider.of<IDatabase>(context, listen: false),
          ),
        ),
      ],
      builder: (context, _) => widget(context.read<AppRouter>().router),
    );
  }
}
