import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    @Default('') String company,
    @Default('') String location,
    @Default('') String position,
    @Default('') String from,
    @Default('') String to,
    @Default('') String description,
    @Default([]) List<String> responsibilities,
  }) = _Experience;
  const Experience._();

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}
