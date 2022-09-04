import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/data/database.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/pages/incidents/incidents_view_model.dart';
import 'package:heroi_da_vez/app/pages/login/login_view_model.dart';
import 'package:provider/provider.dart';

class MultiProviderContext extends StatelessWidget {
  final IDatabase database;
  final Widget widget;

  const MultiProviderContext(
      {Key? key, required this.widget, required this.database})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        Provider<IDatabase>(create: (_) => database),
        ChangeNotifierProvider(
          create: (context) => IncidentsPageViewModel(
            Provider.of<IDatabase>(context, listen: false),
          ),
        )
      ],
      child: widget,
    );
  }
}
