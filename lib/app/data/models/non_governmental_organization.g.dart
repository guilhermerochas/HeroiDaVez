// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_governmental_organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NonGovernamentalOrganization _$NonGovernamentalOrganizationFromJson(
        Map<String, dynamic> json) =>
    NonGovernamentalOrganization(
      name: json['name'] as String,
      id: json['id'] as int? ?? 0,
      loginCode: json['loginCode'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as int?,
    );

Map<String, dynamic> _$NonGovernamentalOrganizationToJson(
        NonGovernamentalOrganization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'loginCode': instance.loginCode,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
