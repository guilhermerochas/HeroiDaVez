import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/providers.dart';
import 'package:heroi_da_vez/app/routes.dart';

class HeroiDaVezApp extends StatelessWidget {
  const HeroiDaVezApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProviderContext(
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
    );
  }
}
