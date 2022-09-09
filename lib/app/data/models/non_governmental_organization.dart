import 'package:heroi_da_vez/app/data/models/incident_case.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'non_governmental_organization.g.dart';

@Entity()
@JsonSerializable()
class NonGovernamentalOrganization {
  int id;
  String name;
  String loginCode;
  String email;
  int? phoneNumber;

  final incidents = ToMany<IncidentCase>();

  NonGovernamentalOrganization({
    required this.name,
    this.id = 0,
    required this.loginCode,
    required this.email,
    this.phoneNumber,
  });

  factory NonGovernamentalOrganization.fromJson(Map<String, dynamic> json) =>
      _$NonGovernamentalOrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$NonGovernamentalOrganizationToJson(this);
}
