import 'dart:async';

import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/domain/usecase/quiz_set/get_quiz_set_list_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/intent/quiz_set_intent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_set_data_notifier.g.dart';

@riverpod
class QuizSetDataNotifier extends _$QuizSetDataNotifier {
  final _navigationEventsController = StreamController<NavigateToQuiz>.broadcast();

  Stream<NavigateToQuiz> get navigationEvents => _navigationEventsController.stream;

  @override
  Future<QuizSetData> build({String? quizTopic}) async {
    // Ensure controller is closed when provider is destroyed
    ref.onDispose(() {
      _navigationEventsController.close();
    });
    return _loadQuizSetInternal(quizTopic ?? "");
  }

  /// Centralized load function (used on init + retry)
  Future<QuizSetData> _loadQuizSetInternal(String quizTopic) async {
    final useCase = await ref.watch(getQuizSetListUseCaseProvider.future);
    return await useCase(quizTopic);
  }

  /// Public function for UI retry
  Future<void> reload({String? quizTopic}) async {
    state = const AsyncLoading();
    try {
      final data = await _loadQuizSetInternal(quizTopic ?? "");
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> navigateToQuiz(QuizSetItem data) async {
    // Assuming QuizScreenData is defined elsewhere
    final quizScreenData = QuizScreenData(quizTitle: data.title, quizDescription: data.description, quizSection: data);
    _navigationEventsController.add(NavigateToQuiz(quizScreenData));
  }
}
