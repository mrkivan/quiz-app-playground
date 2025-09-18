import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart';
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_nav_event.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_data_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_interaction_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_result_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/placeholder_scaffold.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/quiz_app_top_appbar.dart';

import 'quiz_body.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final QuizScreenData screenData;
  final int quizId;

  const QuizScreen({super.key, required this.screenData, required this.quizId});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState<QuizScreen> {
  StreamSubscription<QuizNavEvent>? _navSubscription;
  bool showExitConfirmationDialog = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(quizDataNotifierProvider(screenData: widget.screenData).notifier)
          .reload(screenData: widget.screenData);

      if (widget.quizId > 0) {
        ref
            .read(quizDataNotifierProvider(screenData: widget.screenData).notifier)
            .handleDataIntent(QuizIntent.nextQuestion());
      }

      _navSubscription = ref
          .read(quizResultNotifierProvider(screenData: widget.screenData).notifier)
          .navigationEvents
          .listen((event) {
            if (mounted) {
              GoRouter.of(context).pop();
              /*GoRouter.of(context).push(
            QuizMasterDestinations.routeResult,
            extra: event.resultKey,
          );*/
            }
          });
    });
  }

  @override
  void dispose() {
    _navSubscription?.cancel();
    super.dispose();
  }

  void navigateToNextQuestion() {
    ref
        .read(quizDataNotifierProvider(screenData: widget.screenData).notifier)
        .handleDataIntent(QuizIntent.nextQuestion());
  }

  void loadData() {
    ref.read(quizDataNotifierProvider(screenData: widget.screenData).notifier).reload(screenData: widget.screenData);
  }

  bool showExitDialog() {
    final quizId = ref.read(quizDataNotifierProvider(screenData: widget.screenData).notifier).quizId;
    final selectedAnswers = ref.read(quizInteractionNotifierProvider(screenData: widget.screenData)).selectedAnswers;
    return quizId > 1 || selectedAnswers.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final quizDataAsync = ref.watch(quizDataNotifierProvider(screenData: widget.screenData));
    final quizState = ref.watch(quizInteractionNotifierProvider(screenData: widget.screenData));
    final quizResult = ref.watch(quizResultNotifierProvider(screenData: widget.screenData));

    return Stack(
      children: [
        PlaceholderScaffold(
          toolbarConfig: QuizAppToolbar(
            title: widget.screenData.quizSection?.title ?? '',
            onNavigationClick: () {
              setState(() {
                showExitConfirmationDialog = showExitDialog();
              });
              if (!showExitConfirmationDialog) {
                context.pop();
              }
            },
          ),
          asyncValue: quizDataAsync,
          onRetryClicked: loadData,
          bodyContent: (data) {
            final currentQuizId = ref.read(quizDataNotifierProvider(screenData: widget.screenData).notifier).quizId;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, animation) => SlideTransition(
                    position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
                    child: child,
                  ),
              child: Box(
                key: ValueKey(currentQuizId), // Unique key based on quizId for smooth transition
                child: QuizBody(
                  quizData: data,
                  quizState: quizState,
                  updateSelectedAnswers: (answers) {
                    ref
                        .read(quizInteractionNotifierProvider(screenData: widget.screenData).notifier)
                        .handleInteractionIntent(QuizIntent.updateSelectedAnswers(answers));
                  },
                  submitAnswer: () {
                    ref
                        .read(quizInteractionNotifierProvider(screenData: widget.screenData).notifier)
                        .handleInteractionIntent(QuizIntent.submitAnswer());
                  },
                  skipQuestion: () {
                    ref
                        .read(quizDataNotifierProvider(screenData: widget.screenData).notifier)
                        .handleDataIntent(QuizIntent.skipQuestion());
                  },
                  moveToNextQuestion: navigateToNextQuestion,
                  navigateToResultScreen: () {
                    ref
                        .read(quizResultNotifierProvider(screenData: widget.screenData).notifier)
                        .handleResultIntent(QuizIntent.navigateToResult());
                  },
                ),
              ),
            );
          },
        ),
        if (showExitConfirmationDialog)
          ConfirmDialog(
            title: 'Exit Quiz',
            message: 'Are you sure you want to exit the quiz?',
            onConfirm: () {
              context.pop();
            },
            confirmButtonLabel: 'Confirm',
            showDialogState: showExitConfirmationDialog,
            onDismiss: () {
              setState(() {
                showExitConfirmationDialog = false;
              });
            },
          ),
      ],
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final String confirmButtonLabel;
  final bool showDialogState;
  final VoidCallback? onDismiss;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.confirmButtonLabel,
    required this.showDialogState,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (!showDialogState) return const SizedBox.shrink();
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: onDismiss ?? () => Navigator.of(context).pop(), child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            onConfirm();
            onDismiss?.call();
          },
          child: Text(confirmButtonLabel),
        ),
      ],
    );
  }
}

class Box extends StatelessWidget {
  final Widget child;

  const Box({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: child);
  }
}
