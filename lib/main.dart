import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heroi_da_vez/app/app.dart';
import 'package:heroi_da_vez/app/data/database.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';
import 'package:heroi_da_vez/app/data/models/non_governmental_organization.dart';

import 'app/services/local_storage/i_local_storage_service.dart';
import 'app/services/local_storage/shared_preferences_service.dart';
import 'app/services/login_service/i_login_service.dart';
import 'app/services/login_service/user_login_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  IDatabase database = await AppDatabase.create();

  ILocalStorageService localStorageService =
      await SharedPreferencesService.create();

  ILoginService<NonGovernamentalOrganization?> loginService =
      UserLoginService(localStorageService);

  if (kDebugMode) {
    generateDefaultSeed(database);
  }

  runApp(
    HeroiDaVezApp(
      database: database,
      localStorageService: localStorageService,
      loginService: loginService,
    ),
  );
}

void generateDefaultSeed(IDatabase database) {
  var ongExists = database.nonGovernamentalOrganization.getAll().isNotEmpty;

  if (ongExists) {
    return;
  }

  var ongUser = NonGovernamentalOrganization(
    name: 'Ong do Bem',
    loginCode: '123456',
    email: 'no-reply@heroidavez.com',
  );

  database.nonGovernamentalOrganization.create(ongUser);

  var ong = database.nonGovernamentalOrganization.getAll().first;

  var primeiroCaso = IncidentCase(
    caseName: 'Doação para Cães',
    description: 'Nos ajude com uma doação para cães',
    valueCost: 20,
  );

  var segundoCaso = IncidentCase(
    caseName: 'Doação para Gatos',
    description: 'Nos ajude com uma doação para gatos',
    valueCost: 20,
  );

  primeiroCaso.organization.target = ong;
  segundoCaso.organization.target = ong;

  database.incidentCase.create(primeiroCaso);
  database.incidentCase.create(segundoCaso);

  ong.incidents.addAll(database.incidentCase.getAll());
  database.nonGovernamentalOrganization.update(ong);
}
