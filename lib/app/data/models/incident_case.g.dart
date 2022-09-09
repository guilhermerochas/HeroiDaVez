// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncidentCase _$IncidentCaseFromJson(Map<String, dynamic> json) => IncidentCase(
      id: json['id'] as int? ?? 0,
      caseName: json['caseName'] as String,
      description: json['description'] as String,
      valueCost: (json['valueCost'] as num).toDouble(),
    );

Map<String, dynamic> _$IncidentCaseToJson(IncidentCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caseName': instance.caseName,
      'description': instance.description,
      'valueCost': instance.valueCost,
    };
