import 'package:objectbox/objectbox.dart';

@Entity()
class IncidentCase {
  int id;
  int? nonGovernamentalOrganizationId;
  String caseName;
  String description;
  double valueCost;

  IncidentCase({
    required this.nonGovernamentalOrganizationId,
    this.id = 0,
    required this.caseName,
    required this.description,
    required this.valueCost,
  });
}
