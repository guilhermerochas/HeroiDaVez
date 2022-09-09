import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/pages/incident_detail/incident_detail_view_model.dart';
import 'package:heroi_da_vez/app/pages/incidents/incidents_view_model.dart';
import 'package:heroi_da_vez/app/pages/login/login_view_model.dart';
import 'package:heroi_da_vez/app/services/local_storage/i_local_storage_service.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';
import 'package:provider/provider.dart';

class MultiProviderContext extends StatelessWidget {
  final IDatabase database;
  final ILoginService loginService;
  final ILocalStorageService localStorageService;
  final Widget widget;

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
        Provider<ILoginService>(create: (_) => loginService),
        Provider<IDatabase>(create: (_) => database),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(
            Provider.of<IDatabase>(context, listen: false),
            Provider.of<ILoginService>(context, listen: false),
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
      child: widget,
    );
  }
}
