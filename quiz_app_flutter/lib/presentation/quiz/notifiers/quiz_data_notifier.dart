import 'dart:async';

import 'package:collection/collection.dart';
import 'package:quiz_app_flutter/domain/entities/quiz/quiz_data.dart'; // Adjust import for QuizData
import 'package:quiz_app_flutter/domain/usecase/quiz/get_quiz_data_bysetandtopic_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart'; // Adjust import for QuizIntent
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_nav_event.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'quiz_interaction_notifier.dart';
import 'quiz_result_notifier.dart';

part 'quiz_data_notifier.g.dart';

@riverpod
class QuizDataNotifier extends _$QuizDataNotifier {
  final _navigationEventsController = StreamController<QuizNavEvent>.broadcast();

  Stream<QuizNavEvent> get navigationEvents => _navigationEventsController.stream;

  List<QuizData> _cacheQuizList = [];
  int _currentQuizPosition = 0;
  QuizScreenData? _cacheScreenData;

  @override
  Future<QuizData> build({required QuizScreenData screenData}) async {
    ref.onDispose(() {
      _navigationEventsController.close();
    });
    _cacheScreenData = screenData;
    return _loadQuizInternal(screenData);
  }

  Future<QuizData> _loadQuizInternal(QuizScreenData screenData) async {
    final useCase = await ref.watch(getQuizDataBySetAndTopicUseCaseProvider.future);
    _cacheQuizList = (await useCase(screenData.quizSection?.fileName ?? '')).shuffled();
    _currentQuizPosition = 0;
    return _cacheQuizList[_currentQuizPosition];
  }

  Future<void> reload({required QuizScreenData screenData}) async {
    state = const AsyncLoading();
    try {
      final data = await _loadQuizInternal(screenData);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void _moveToNextQuestion({bool isSkipped = false}) {
    ref.read(quizResultNotifierProvider(screenData: _cacheScreenData!).notifier).saveResult(isSkipped: isSkipped);

    final nextIndex = _currentQuizPosition + 1;
    if (nextIndex < _cacheQuizList.length) {
      _currentQuizPosition = nextIndex;
      ref.read(quizInteractionNotifierProvider(screenData: _cacheScreenData!).notifier).resetForNextQuestion();
      ref
          .read(quizInteractionNotifierProvider(screenData: _cacheScreenData!).notifier)
          .updateQuizState(
            currentQuestionNumber: quizId,
            totalQuestions: _cacheQuizList.length,
            isLastItem: isLastItem,
          );
      state = AsyncData(_cacheQuizList[_currentQuizPosition]); // Emit current quiz to trigger UI update
    } else {
      ref.read(quizResultNotifierProvider(screenData: _cacheScreenData!).notifier).navigateToResultScreen();
    }
  }

  Future<void> handleDataIntent(QuizIntent intent) async {
    if (intent is LoadQuiz) {
      await reload(screenData: intent.data);
    } else if (intent is NextQuestion) {
      _moveToNextQuestion();
    } else if (intent is SkipQuestion) {
      _moveToNextQuestion(isSkipped: true);
    }
  }

  QuizData get currentQuiz => _cacheQuizList[_currentQuizPosition];

  int get quizId => _currentQuizPosition + 1;

  bool get isLastItem => _currentQuizPosition + 1 == _cacheQuizList.length;

  int get totalQuiz => _cacheQuizList.length;
}
