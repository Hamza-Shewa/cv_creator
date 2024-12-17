import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  const factory Education({
    @Default('') String university,
    @Default('') String faculty,
    @Default('') String major,
    @Default('') String location,
    @Default('') String from,
    @Default('') String to,
  }) = _Education;
  const Education._();

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
