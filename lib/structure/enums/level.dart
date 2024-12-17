import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
enum Level {
  beginner('Beginner'),
  intermedient('Intermedient'),
  advanced('Advanced'),
  profissional('Profissional'),
  fluent('Fluent'),

  native('Native');

  final String name;
  const Level(this.name);

  static getStatus(String status) {
    switch (status) {
      case 'Beginner':
        return Level.beginner;
      case 'Intermedient':
        return Level.intermedient;
      case 'Advanced':
        return Level.advanced;
      case 'Profissional':
        return Level.profissional;
      case 'Fluent':
        return Level.fluent;
      case 'Native':
        return Level.native;
      default:
        return Level.beginner;
    }
  }
}
