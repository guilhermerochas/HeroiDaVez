// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:heroi_da_vez/app/data/i_database.dart';
import 'package:heroi_da_vez/app/data/models/incident_case.dart';

class IncidentDetailViewModel extends ChangeNotifier {
  final IDatabase _database;

  IncidentDetailViewModel(this._database);

  IncidentCase handleFindIncidentCase(int id) {
    return _database.incidentCase.getById(id);
  }
}
