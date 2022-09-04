import 'package:heroi_da_vez/app/data/models/incident_case.dart';
import 'package:heroi_da_vez/app/data/models/non_governmental_organization.dart';
import 'package:heroi_da_vez/app/data/repositories/i_repository.dart';

abstract class IDatabase {
  late IRepository<NonGovernamentalOrganization> nonGovernamentalOrganization;
  late IRepository<IncidentCase> incidentCase;
}
