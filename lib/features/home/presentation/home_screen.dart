import 'package:app/core/widgets/base_widget.dart';
import 'package:app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.router.replaceAll([const LoginRoute()]);
            },
            child: const Text('Goto Login')),
      ),
    );
  }
}
