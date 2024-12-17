// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceImpl _$$ExperienceImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceImpl(
      company: json['company'] as String? ?? '',
      location: json['location'] as String? ?? '',
      position: json['position'] as String? ?? '',
      from: json['from'] as String? ?? '',
      to: json['to'] as String? ?? '',
      description: json['description'] as String? ?? '',
      responsibilities: (json['responsibilities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExperienceImplToJson(_$ExperienceImpl instance) =>
    <String, dynamic>{
      'company': instance.company,
      'location': instance.location,
      'position': instance.position,
      'from': instance.from,
      'to': instance.to,
      'description': instance.description,
      'responsibilities': instance.responsibilities,
    };
