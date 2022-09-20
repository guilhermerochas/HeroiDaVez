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

  Future<IDatabase> database = AppDatabase.create();

  Future<ILocalStorageService> localStorageService =
      SharedPreferencesService.create();

  var values = await Future.wait([
    database,
    localStorageService,
  ]);

  var databaseResult = values[0] as IDatabase;
  var localStorageServiceResult = values[1] as ILocalStorageService;

  ILoginService<NonGovernamentalOrganization?> loginService = UserLoginService(
    localStorageServiceResult,
  );

  generateDefaultSeed(databaseResult);

  runApp(
    HeroiDaVezApp(
      database: databaseResult,
      localStorageService: localStorageServiceResult,
      loginService: loginService,
    ),
  );
}

void generateDefaultSeed(IDatabase database) {
  if (kDebugMode) {
    database.nonGovernamentalOrganization.getAll().forEach((element) {
      database.nonGovernamentalOrganization.delete(element.id);
    });

    database.incidentCase.getAll().forEach((element) {
      database.incidentCase.delete(element.id);
    });
  }

  var ongExists = database.nonGovernamentalOrganization.getAll().isNotEmpty;

  if (ongExists) {
    return;
  }

  var ongUser = NonGovernamentalOrganization(
    name: 'Ong do Bem',
    loginCode: '123456',
    email: 'no-reply-heroidavez@gmail.com',
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
