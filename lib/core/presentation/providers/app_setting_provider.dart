import 'package:app/core/domain/enities/app_setting.dart';
import 'package:app/core/presentation/widgets/base_widget.dart';

class AppSettingNotifier extends StateNotifier<AppSetting> {
  AppSettingNotifier({required AppSetting setting}) : super(setting);

  void updateAppVersion(String version) {
    state = state.copyWith(version: version);
  }
}

final appSettingProvider = StateNotifierProvider<AppSettingNotifier, AppSetting>((ref) {
  throw UnimplementedError();
});
