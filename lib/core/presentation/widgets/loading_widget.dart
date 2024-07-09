import 'package:app/core/presentation/widgets/base_widget.dart';

class LoadingWidget extends HookConsumerWidget {
  const LoadingWidget({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Visibility(
            visible: message != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                message!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
