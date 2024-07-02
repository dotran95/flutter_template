import 'package:app/core/widgets/base_widget.dart';
import 'package:app/get_it_setup.dart';
import 'package:app/routing/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupGetIt();
  runApp(const ProviderScope(
    child: MyApp(),
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
