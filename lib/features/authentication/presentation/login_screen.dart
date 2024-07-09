import 'package:app/core/presentation/widgets/base_widget.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text('Goto Home')),
      ),
    );
  }
}
