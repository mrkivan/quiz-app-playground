import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_data_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_interaction_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_result_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:quiz_app_flutter/presentation/route/app_router.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/confirm_dialog.dart';
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
  bool showExitConfirmationDialog = false;

  QuizDataNotifier get _quizDataNotifier => ref.read(quizDataNotifierProvider(screenData: widget.screenData).notifier);

  QuizInteractionNotifier get _quizInteractionNotifier =>
      ref.read(quizInteractionNotifierProvider(screenData: widget.screenData).notifier);

  QuizResultNotifier get _quizResultNotifier =>
      ref.read(quizResultNotifierProvider(screenData: widget.screenData).notifier);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _quizDataNotifier.reload(screenData: widget.screenData);
    });
  }

  void navigateToNextQuestion() {
    _quizDataNotifier.handleDataIntent(QuizIntent.nextQuestion());
  }

  void loadData() {
    _quizDataNotifier.reload(screenData: widget.screenData);
  }

  bool showExitDialog() {
    final quizState = ref.read(quizInteractionNotifierProvider(screenData: widget.screenData));
    return quizState.hasInteracted;
  }

  @override
  Widget build(BuildContext context) {
    final quizDataAsync = ref.watch(quizDataNotifierProvider(screenData: widget.screenData));
    final quizState = ref.watch(quizInteractionNotifierProvider(screenData: widget.screenData));

    // Navigate to result screen if last item and results are saved
    if (quizState.isLastItem && quizDataAsync.hasValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _quizResultNotifier.saveResultData();
        if (mounted) {
          final resultKey = await _quizResultNotifier.saveResultData();
          context.pushReplacement(QuizMasterDestinations.routeResult, extra: resultKey);
        }
      });
    }

    return PopScope(
      canPop: !showExitDialog(),
      onPopInvoked: (didPop) async {
        if (didPop) return;
        setState(() {
          showExitConfirmationDialog = showExitDialog();
        });
      },
      child: Stack(
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
              final currentQuizId = _quizDataNotifier.getNextQuizPosition;
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder:
                    (child, animation) => SlideTransition(
                      position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
                      child: child,
                    ),
                child: Container(
                  key: ValueKey(currentQuizId),
                  constraints: BoxConstraints.expand(),
                  child: QuizBody(
                    quizData: data,
                    quizState: quizState,
                    updateSelectedAnswers: (answers) {
                      _quizInteractionNotifier.handleInteractionIntent(QuizIntent.updateSelectedAnswers(answers));
                    },
                    submitAnswer: () {
                      _quizInteractionNotifier.handleInteractionIntent(QuizIntent.submitAnswer());
                    },
                    skipQuestion: () {
                      _quizDataNotifier.handleDataIntent(QuizIntent.skipQuestion());
                    },
                    moveToNextQuestion: navigateToNextQuestion,
                    navigateToResultScreen: () async {
                      final resultKey = await _quizResultNotifier.saveResultData();
                      if (mounted) {
                        context.pushReplacement(QuizMasterDestinations.routeResult, extra: resultKey);
                      }
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
              onConfirm: () => context.pop(),
              confirmButtonLabel: 'Confirm',
              showDialogState: showExitConfirmationDialog,
              onDismiss: () {
                setState(() {
                  showExitConfirmationDialog = false;
                });
              },
            ),
        ],
      ),
    );
  }
}
