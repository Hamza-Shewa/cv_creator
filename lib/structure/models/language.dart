import 'package:cv_creator/structure/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class Language with _$Language {
  const factory Language({
    @Default('') String language,
    @Default(Level.beginner) Level level,
  }) = _Language;
  const Language._();

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
