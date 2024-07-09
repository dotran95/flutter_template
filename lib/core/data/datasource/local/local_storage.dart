import 'package:app/core/data/datasource/models/setting.dart';
import 'package:app/core/domain/enities/app_setting.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalStorage {
  Future<AppSetting?> appSetting();
  Future<void> updateAppLanguage({required String language});
  Future<void> updateAppVersion({required String version});
}

class HiveLocalStorage implements LocalStorage {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SettingAdapter());
    Hive.registerAdapter(LanguageAdapter());
    Hive.registerAdapter(HiveAppModesAdapter());
  }

  @override
  Future<AppSetting?> appSetting() async {
    final settingBox = await Hive.openLazyBox<Setting>('setting');
    final setting = await settingBox.get('setting');
    return setting?.convertAppSetting();
  }

  @override
  Future<void> updateAppLanguage({required String language}) async {
    try {
      final settingBox = await Hive.openLazyBox<Setting>('setting');
      final setting = await settingBox.get('setting');
      final newLanguage = Language.values.firstWhere((e) => e.toString() == 'Language.$language', orElse: () => Language.en);
      if (setting != null) {
        setting.language = newLanguage;
        settingBox.put('setting', setting);
      } else {
        final newSetting = Setting.create();
        newSetting.language = newLanguage;
        settingBox.put('setting', newSetting);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> updateAppVersion({required String version}) async {
    try {
      final settingBox = await Hive.openLazyBox<Setting>('setting');
      final setting = await settingBox.get('setting');

      final newSetting = setting ?? Setting.create();
      if (setting == null) {
        newSetting.language = Language.en;
      }
      newSetting.version = version;
      settingBox.put('setting', newSetting);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
