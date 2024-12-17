// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationImpl _$$EducationImplFromJson(Map<String, dynamic> json) =>
    _$EducationImpl(
      university: json['university'] as String? ?? '',
      faculty: json['faculty'] as String? ?? '',
      major: json['major'] as String? ?? '',
      location: json['location'] as String? ?? '',
      from: json['from'] as String? ?? '',
      to: json['to'] as String? ?? '',
    );

Map<String, dynamic> _$$EducationImplToJson(_$EducationImpl instance) =>
    <String, dynamic>{
      'university': instance.university,
      'faculty': instance.faculty,
      'major': instance.major,
      'location': instance.location,
      'from': instance.from,
      'to': instance.to,
    };
