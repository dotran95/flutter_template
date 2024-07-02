import 'package:app/routing/app_router.dart';
import 'package:get_it/get_it.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
}
