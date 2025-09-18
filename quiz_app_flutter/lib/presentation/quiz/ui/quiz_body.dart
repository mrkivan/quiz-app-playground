import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/quiz/quiz_data.dart';
import 'package:quiz_app_flutter/presentation/quiz/quiz_state.dart';

import 'quiz_buttons.dart';

class QuizBody extends ConsumerWidget {
  final QuizData quizData;
  final QuizState quizState;
  final void Function(List<int>) updateSelectedAnswers;
  final VoidCallback submitAnswer;
  final VoidCallback skipQuestion;
  final VoidCallback moveToNextQuestion;
  final VoidCallback navigateToResultScreen;

  const QuizBody({
    super.key,
    required this.quizData,
    required this.quizState,
    required this.updateSelectedAnswers,
    required this.submitAnswer,
    required this.skipQuestion,
    required this.moveToNextQuestion,
    required this.navigateToResultScreen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Question and Progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(quizData.question, style: Theme.of(context).textTheme.titleMedium)),
              // Replace with your progress widget
              Text('${quizState.currentQuestionNumber} / ${quizState.totalQuestions}'),
            ],
          ),
          const SizedBox(height: 16),

          // Answer Options
          Expanded(
            child: ListView.separated(
              itemCount: quizData.answerCellList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final answer = quizData.answerCellList[index];
                final isSelected = quizState.selectedAnswers.contains(answer.answerId);
                final isCorrect = quizData.correctAnswer.answerId.contains(answer.answerId);

                Color backgroundColor;
                if (!quizState.isSubmitted) {
                  backgroundColor = Theme.of(context).colorScheme.surface;
                } else if (isSelected && isCorrect) {
                  backgroundColor = Colors.green.withValues(alpha: 0.2);
                } else if (isSelected && !isCorrect) {
                  backgroundColor = Colors.red.withValues(alpha: 0.2);
                } else {
                  backgroundColor = Theme.of(context).colorScheme.surface;
                }

                return InkWell(
                  onTap:
                      !quizState.isSubmitted
                          ? () {
                            if (quizData.answerCellType == 0) {
                              // Single choice
                              updateSelectedAnswers([answer.answerId]);
                            } else {
                              // Multiple choice toggle
                              final newSelection =
                                  isSelected
                                      ? quizState.selectedAnswers.where((id) => id != answer.answerId).toList()
                                      : [...quizState.selectedAnswers, answer.answerId];
                              updateSelectedAnswers(newSelection);
                            }
                          }
                          : null,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey),
                    ),
                    child: Row(
                      children: [
                        quizData.answerCellType == 0
                            ? Radio<int>(
                              value: answer.answerId,
                              groupValue: isSelected ? answer.answerId : null,
                              onChanged:
                                  quizState.isSubmitted
                                      ? null
                                      : (value) {
                                        updateSelectedAnswers([answer.answerId]);
                                      },
                            )
                            : Checkbox(
                              value: isSelected,
                              onChanged:
                                  quizState.isSubmitted
                                      ? null
                                      : (value) {
                                        final newSelection =
                                            value == true
                                                ? [...quizState.selectedAnswers, answer.answerId]
                                                : quizState.selectedAnswers
                                                    .where((id) => id != answer.answerId)
                                                    .toList();
                                        updateSelectedAnswers(newSelection);
                                      },
                            ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(answer.data)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Explanation
          if (quizState.showExplanation) ...[
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(padding: const EdgeInsets.all(16.0), child: Text(quizData.explanation)),
            ),
          ],

          // Buttons
          QuizButtons(
            quizState: quizState,
            submitAnswer: submitAnswer,
            skipQuestion: skipQuestion,
            moveToNextQuestion: moveToNextQuestion,
            navigateToResultScreen: navigateToResultScreen,
          ),
        ],
      ),
    );
  }
}
