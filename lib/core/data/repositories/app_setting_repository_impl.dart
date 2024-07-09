import 'package:app/core/data/datasource/local/local_storage.dart';
import 'package:app/core/domain/enities/app_setting.dart';
import 'package:app/core/domain/repositories/app_setting_repository.dart';

class AppSettingRepositoryImpl implements AppSettingRepository {
  final LocalStorage _storage;

  AppSettingRepositoryImpl({
    required LocalStorage localStorage,
  }) : _storage = localStorage;

  @override
  Future<AppSetting> setting() async {
    final setting = await _storage.appSetting();
    return setting ??
        AppSetting(
          version: '1.0.0',
          language: AppLanguage.en,
          mode: AppModes.light,
        );
  }
}
