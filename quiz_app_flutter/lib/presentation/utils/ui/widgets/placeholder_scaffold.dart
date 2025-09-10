import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/presentation/utils/state/quiz_app_ui_state.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/quiz_app_top_appbar.dart';

import 'background_wrapper.dart';

/// A reusable scaffold with background image and placeholder handling
class PlaceholderScaffold<T> extends StatelessWidget {
  final QuizAppToolbar toolbarConfig;
  final QuizAppUiState<T> uiState;
  final EdgeInsetsGeometry padding;
  final void Function() onRetryClicked;
  final Widget Function(T data) bodyContent;

  const PlaceholderScaffold({
    super.key,
    required this.toolbarConfig,
    required this.uiState,
    required this.bodyContent,
    this.onRetryClicked = _defaultRetry,
    this.padding = EdgeInsets.zero,
  });

  static void _defaultRetry() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizAppTopAppBar(toolbarConfig: toolbarConfig),
      body: BackgroundWrapper(
        child: Padding(
          padding: padding,
          child: Builder(
            builder: (_) {
              return uiState.map(
                loading: (_) => const LoadingView(),
                success: (s) => bodyContent(s.data),
                error:
                    (e) => ErrorView(
                      message: e.message,
                      onRetryClicked: onRetryClicked,
                    ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorView extends StatelessWidget {
  final String message;
  final void Function() onRetryClicked;

  const ErrorView({
    super.key,
    required this.message,
    required this.onRetryClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message.isNotEmpty
                ? message
                : "Failed to load data. Please try again.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onRetryClicked,
            icon: const Icon(Icons.refresh, size: 20),
            label: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
