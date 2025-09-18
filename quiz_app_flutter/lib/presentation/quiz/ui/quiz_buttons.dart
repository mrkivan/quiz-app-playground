import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/generated/locale_keys.g.dart';
import 'package:quiz_app_flutter/presentation/quiz/state/quiz_state.dart';

class QuizButtons extends ConsumerStatefulWidget {
  final QuizState quizState;
  final VoidCallback submitAnswer;
  final VoidCallback skipQuestion;
  final VoidCallback moveToNextQuestion;
  final VoidCallback navigateToResultScreen;

  const QuizButtons({
    super.key,
    required this.quizState,
    required this.submitAnswer,
    required this.skipQuestion,
    required this.moveToNextQuestion,
    required this.navigateToResultScreen,
  });

  @override
  ConsumerState<QuizButtons> createState() => _QuizButtonsState();
}

class _QuizButtonsState extends ConsumerState<QuizButtons> {
  bool showSkipDialog = false;
  bool showSubmitConfirmationDialog = false;

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(LocaleKeys.submit_dialog_title.tr()),
            content: Text(LocaleKeys.submit_dialog_description.tr()),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(LocaleKeys.button_cancel.tr())),
              TextButton(
                onPressed: () {
                  widget.submitAnswer();
                  Navigator.pop(context);
                },
                child: Text(LocaleKeys.button_confirm.tr()),
              ),
            ],
          ),
    );
  }

  void _showSkipDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(LocaleKeys.skip_dialog_title.tr()),
            content: Text(LocaleKeys.skip_dialog_description.tr()),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(LocaleKeys.button_cancel.tr())),
              TextButton(
                onPressed: () {
                  widget.skipQuestion();
                  Navigator.pop(context);
                },
                child: Text(LocaleKeys.button_skip.tr()),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizState = widget.quizState;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Skip Button
          Expanded(
            child: ElevatedButton(
              onPressed:
                  (!quizState.isSubmitted && quizState.selectedAnswers.isEmpty && !quizState.isLastItem)
                      ? _showSkipDialog
                      : null,
              child: Text(LocaleKeys.button_skip.tr()),
            ),
          ),
          const SizedBox(width: 8),
          // Submit Button
          Expanded(
            child: ElevatedButton(
              onPressed: (quizState.selectedAnswers.isNotEmpty && !quizState.isSubmitted) ? _showSubmitDialog : null,
              child: Text(LocaleKeys.button_submit.tr()),
            ),
          ),
          const SizedBox(width: 8),
          // Next / Result Button
          Expanded(
            child: ElevatedButton(
              onPressed:
                  (quizState.isSubmitted || quizState.isLastItem)
                      ? () {
                        if (quizState.isLastItem) {
                          widget.navigateToResultScreen();
                        } else {
                          widget.moveToNextQuestion();
                        }
                      }
                      : null,
              child: Text(quizState.isLastItem ? LocaleKeys.button_result.tr() : LocaleKeys.button_next.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
