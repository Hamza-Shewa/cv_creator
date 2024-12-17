// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      language: json['language'] as String? ?? '',
      level:
          $enumDecodeNullable(_$LevelEnumMap, json['level']) ?? Level.beginner,
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'level': _$LevelEnumMap[instance.level]!,
    };

const _$LevelEnumMap = {
  Level.beginner: 'beginner',
  Level.intermedient: 'intermedient',
  Level.advanced: 'advanced',
  Level.profissional: 'profissional',
  Level.fluent: 'fluent',
  Level.native: 'native',
};
