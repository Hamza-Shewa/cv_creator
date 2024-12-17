import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
enum Socials {
  github('Github'),
  linkedin('LinkedIn'),
  facebook('Facebook'),
  x('X'),
  portofolio('Portofolio'),
  bihance('BiHance'),
  other('Other');

  final String name;
  const Socials(this.name);

  static getStatus(String status) {
    switch (status) {
      case 'Github':
        return Socials.github;
      case 'LinkedIn':
        return Socials.linkedin;
      case 'Facebook':
        return Socials.facebook;
      case 'X':
        return Socials.x;
      case 'Portofolio':
        return Socials.portofolio;
      case 'BiHance':
        return Socials.bihance;
      case 'Other':
        return Socials.other;
      default:
        return Socials.other;
    }
  }
}
