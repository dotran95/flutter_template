import 'dart:async';
import 'package:app/core/data/datasource/local/local_storage.dart';
import 'package:app/core/data/repositories/app_setting_repository_impl.dart';
import 'package:app/core/domain/repositories/app_setting_repository.dart';
import 'package:app/core/domain/usecases/app_setting_usecase.dart';
import 'package:app/routing/app_router.dart';
import 'package:get_it/get_it.dart';

Future<void> setupGetItinjection() async {
  final getIt = GetIt.I;
  getIt.registerSingleton<AppRouter>(AppRouter());

  //LocalStorage
  await HiveLocalStorage.init();
  getIt.registerSingleton<LocalStorage>(HiveLocalStorage());

// App Setting
  getIt.registerFactory<AppSettingRepository>(() => AppSettingRepositoryImpl(localStorage: getIt.get()));
  getIt.registerFactory<GetAppSettingUsecase>(() => GetAppSettingUsecase(getIt.get()));
}
