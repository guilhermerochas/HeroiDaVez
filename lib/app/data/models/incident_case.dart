import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:heroi_da_vez/app/data/models/non_governmental_organization.dart';

part 'incident_case.g.dart';

@Entity()
@JsonSerializable()
class IncidentCase {
  int id;
  String caseName;
  String description;
  double valueCost;

  final organization = ToOne<NonGovernamentalOrganization>();

  IncidentCase({
    this.id = 0,
    required this.caseName,
    required this.description,
    required this.valueCost,
  });

  factory IncidentCase.fromJson(Map<String, dynamic> json) =>
      _$IncidentCaseFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentCaseToJson(this);
}
