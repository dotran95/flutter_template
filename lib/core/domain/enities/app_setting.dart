// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AppLanguage { en, vi, jp }

enum AppModes { dark, light }

class AppSetting {
  final String version;
  final AppLanguage language;
  final AppModes mode;

  AppSetting({required this.version, required this.language, required this.mode});

  AppSetting copyWith({
    String? version,
    AppLanguage? language,
    AppModes? mode,
  }) {
    return AppSetting(version: version ?? this.version, language: language ?? this.language, mode: mode ?? this.mode);
  }
}
