import 'package:app/core/widgets/base_widget.dart';
import 'package:app/core/widgets/loading_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void loadData() async {
      await Future.delayed(const Duration(seconds: 20));
      // ignore: use_build_context_synchronously
      context.router.pushNamed('/home');
    }

    useEffect(() {
      loadData();
      return null;
    }, []);

    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const LoadingWidget(message: 'Loading, please wait...'),
      ),
    );
  }
}
