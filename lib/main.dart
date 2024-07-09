import 'package:app/core/presentation/providers/app_setting_provider.dart';
import 'package:app/core/presentation/widgets/base_widget.dart';
import 'package:app/get_it_setup.dart';
import 'package:app/routing/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:get_it/get_it.dart';

import 'core/domain/usecases/app_setting_usecase.dart';

void main() async {
  await setupGetItinjection();

  //Get App Setting
  final setting = await GetIt.I.get<GetAppSettingUsecase>().execute();

  runApp(ProviderScope(
    overrides: [
      appSettingProvider.overrideWith((ref) => AppSettingNotifier(setting: setting)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
