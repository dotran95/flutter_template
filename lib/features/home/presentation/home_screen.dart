import 'dart:math';

import 'package:app/core/presentation/providers/app_setting_provider.dart';
import 'package:app/core/presentation/widgets/base_widget.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('HomeScreen build');

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      var rng = Random();
                      final count = rng.nextInt(100);
                      ref.read(appSettingProvider.notifier).updateAppVersion('1.1.$count');
                    },
                    child: const Text('Goto Home')),
              ),
            ),
          ),
          const TextVersion(),
        ],
      )),
    );
  }
}

class TextVersion extends HookConsumerWidget {
  const TextVersion({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(appSettingProvider.select((e) => e.version));

    debugPrint('TextVersion $version');
    return Center(child: Text(version));
  }
}
