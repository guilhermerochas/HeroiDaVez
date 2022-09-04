import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/app.dart';
import 'package:heroi_da_vez/app/data/database.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  IDatabase database = await AppDatabse.create();

  runApp(HeroiDaVezApp(
    database: database,
  ));
}
