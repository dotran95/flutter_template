import 'package:app/core/domain/enities/app_setting.dart';
import 'package:hive/hive.dart';

part 'setting.g.dart';

@HiveType(typeId: 1)
class Setting {
  @HiveField(0, defaultValue: '1.0.0')
  late String version;

  @HiveField(1)
  late Language language;

  @HiveField(2)
  late HiveAppModes mode;

  static Setting create() {
    final setting = Setting();
    setting.language = Language.en;
    setting.version = "1.0.0";
    setting.mode = HiveAppModes.light;
    return setting;
  }
}

@HiveType(typeId: 2)
enum Language {
  @HiveField(0)
  vi,

  @HiveField(1, defaultValue: true)
  en,
}

@HiveType(typeId: 3)
enum HiveAppModes {
  @HiveField(0)
  dark,

  @HiveField(1, defaultValue: true)
  light,
}

extension OnSetting on Setting {
  AppSetting convertAppSetting() {
    final newLanguage = AppLanguage.values.firstWhere(
      (e) => e.toString() == 'AppLanguage.$language',
      orElse: () => AppLanguage.en,
    );

    final newMode = AppModes.values.firstWhere(
      (e) => e.toString() == 'AppModes.$language',
      orElse: () => AppModes.light,
    );

    return AppSetting(version: version, language: newLanguage, mode: newMode);
  }
}
