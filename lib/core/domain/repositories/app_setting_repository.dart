import 'package:app/core/domain/enities/app_setting.dart';

abstract class AppSettingRepository {
  Future<AppSetting> setting();
}
