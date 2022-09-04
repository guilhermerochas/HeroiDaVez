import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/data/repositories/generic_repository.dart';
import 'package:heroi_da_vez/app/data/repositories/i_repository.dart';
import 'package:heroi_da_vez/app/data/models/non_governmental_organization.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';

import '../../objectbox.g.dart';

class AppDatabse implements IDatabase {
  final Store _store;

  @override
  late IRepository<IncidentCase> incidentCase;
  @override
  late IRepository<NonGovernamentalOrganization> nonGovernamentalOrganization;

  AppDatabse._create(this._store) {
    nonGovernamentalOrganization =
        GenericRepository<NonGovernamentalOrganization>(_store);
    incidentCase = GenericRepository<IncidentCase>(_store);
  }

  static Future<AppDatabse> create() async {
    var storeInstance = await openStore();
    var instance = AppDatabse._create(storeInstance);

    return instance;
  }
}
