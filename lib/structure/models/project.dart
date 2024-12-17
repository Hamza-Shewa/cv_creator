import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    @Default('') String name,
    @Default('') String description,
    @Default('') String url,
    @Default('') String from,
    @Default('') String to,
    @Default([]) List<String> responsibilities,
  }) = _Project;
  const Project._();

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
