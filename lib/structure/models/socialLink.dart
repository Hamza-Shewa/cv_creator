import 'package:cv_creator/structure/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'socialLink.freezed.dart';
part 'socialLink.g.dart';

@freezed
class SocialLink with _$SocialLink {
  const factory SocialLink({
    @Default('') String link,
    @Default(Socials.github) Socials social,
    @Default('') String name,
  }) = _SocialLink;
  const SocialLink._();

  factory SocialLink.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkFromJson(json);
}
