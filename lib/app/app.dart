import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/providers.dart';
import 'package:heroi_da_vez/app/routes.dart';
import 'package:heroi_da_vez/app/services/local_storage/i_local_storage_service.dart';
import 'package:heroi_da_vez/app/services/login_service/i_login_service.dart';

class HeroiDaVezApp extends StatelessWidget {
  final IDatabase database;
  final ILoginService loginService;
  final ILocalStorageService localStorageService;

  const HeroiDaVezApp({
    Key? key,
    required this.database,
    required this.loginService,
    required this.localStorageService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProviderContext(
      database: database,
      widget: MaterialApp.router(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red[300] as Color,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
      localStorageService: localStorageService,
      loginService: loginService,
    );
  }
}
