import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/presentation/quiz/quiz_state.dart';

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
            title: const Text('Submit Answer'),
            content: const Text('Are you sure you want to submit your answer?'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  widget.submitAnswer();
                  Navigator.pop(context);
                },
                child: const Text('Confirm'),
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
            title: const Text('Skip Question'),
            content: const Text('Are you sure you want to skip this question?'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  widget.skipQuestion();
                  Navigator.pop(context);
                },
                child: const Text('Skip'),
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
              child: const Text('Skip'),
            ),
          ),
          const SizedBox(width: 8),
          // Submit Button
          Expanded(
            child: ElevatedButton(
              onPressed: (quizState.selectedAnswers.isNotEmpty && !quizState.isSubmitted) ? _showSubmitDialog : null,
              child: const Text('Submit'),
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
              child: Text(quizState.isLastItem ? 'Result' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}
