import 'package:flutter/cupertino.dart';
import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';
import 'package:heroi_da_vez/app/routes.dart';

class IncidentsPageViewModel extends ChangeNotifier {
  final IDatabase _database;

  IncidentsPageViewModel(this._database);

  List<IncidentCase> loadIncidents() => _database.incidentCase.getAll();

  void handleIncidentSelected(int incidentId) {
    router.push(
      "${Routes.incidentDetail.defaultRouteName}$incidentId",
    );
    notifyListeners();
  }
}
