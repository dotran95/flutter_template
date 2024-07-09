import 'package:app/core/domain/enities/app_setting.dart';
import 'package:app/core/domain/repositories/app_setting_repository.dart';

class GetAppSettingUsecase {
  final AppSettingRepository _repo;

  GetAppSettingUsecase(AppSettingRepository repo) : _repo = repo;

  Future<AppSetting> execute() => _repo.setting();
}
