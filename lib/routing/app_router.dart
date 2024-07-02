import 'package:app/features/authentication/presentation/login_screen.dart';
import 'package:app/features/home/presentation/home_screen.dart';
import 'package:app/features/splash/presentation/splash_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
        ),
        AutoRoute(
          children: const [],
          page: HomeRoute.page,
          path: '/home',
        ),
        AutoRoute(path: '/login', page: LoginRoute.page),
      ];
}
