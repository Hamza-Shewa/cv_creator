import 'package:cv_creator/structure/models/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String name,
    @Default('') String title,
    @Default('') String about,
    @Default('') String email,
    @Default('') String phoneNumber,
    @Default('') String address,
    @Default([]) List<SocialLink> socials,
    @Default([]) List<String> skills,
    @Default([]) List<Education> educations,
    @Default([]) List<Language> languages,
    @Default([]) List<Experience> experiences,
    @Default([]) List<Project> projects,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
