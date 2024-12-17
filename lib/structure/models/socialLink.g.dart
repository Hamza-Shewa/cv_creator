// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socialLink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLinkImpl _$$SocialLinkImplFromJson(Map<String, dynamic> json) =>
    _$SocialLinkImpl(
      link: json['link'] as String? ?? '',
      social: $enumDecodeNullable(_$SocialsEnumMap, json['social']) ??
          Socials.github,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$SocialLinkImplToJson(_$SocialLinkImpl instance) =>
    <String, dynamic>{
      'link': instance.link,
      'social': _$SocialsEnumMap[instance.social]!,
      'name': instance.name,
    };

const _$SocialsEnumMap = {
  Socials.github: 'github',
  Socials.linkedin: 'linkedin',
  Socials.facebook: 'facebook',
  Socials.x: 'x',
  Socials.portofolio: 'portofolio',
  Socials.bihance: 'bihance',
  Socials.other: 'other',
};
