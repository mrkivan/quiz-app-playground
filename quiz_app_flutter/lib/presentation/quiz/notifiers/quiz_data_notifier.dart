import 'dart:async';
import 'package:collection/collection.dart';
import 'package:quiz_app_flutter/domain/entities/quiz/quiz_data.dart';
import 'package:quiz_app_flutter/domain/usecase/quiz/get_quiz_data_bysetandtopic_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/intent/quiz_intent.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_interaction_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/notifiers/quiz_result_notifier.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_data_notifier.g.dart';

@riverpod
class QuizDataNotifier extends _$QuizDataNotifier {
  List<QuizData> _cacheQuizList = [];
  int _currentQuizPosition = 0;
  QuizScreenData? _cacheScreenData;

  @override
  Future<QuizData> build({required QuizScreenData screenData}) async {
    _cacheScreenData = screenData;
    return _loadQuizInternal(screenData);
  }

  Future<QuizData> _loadQuizInternal(QuizScreenData screenData) async {
    final useCase = await ref.read(getQuizDataBySetAndTopicUseCaseProvider.future);
    _cacheQuizList = (await useCase(screenData.quizSection?.fileName ?? '')).shuffled();
    _currentQuizPosition = 0;
    ref.read(quizInteractionNotifierProvider(screenData: screenData).notifier).updateQuizState(
      currentQuestionNumber: _currentQuizPosition + 1, // Set to 1 for first item
      totalQuestions: _cacheQuizList.length, // Set total questions
      isLastItem: _cacheQuizList.length <= 1,
    );
    return _cacheQuizList[_currentQuizPosition];
  }

  Future<void> reload({required QuizScreenData screenData}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadQuizInternal(screenData));
  }

  void _moveToNextQuestion({bool isSkipped = false}) {
    final nextIndex = getNextQuizPosition;
    if (nextIndex < _cacheQuizList.length) {
      // Save result for current question (skip or next)
      if (isSkipped || state.value != null) {
        ref.read(quizResultNotifierProvider(screenData: _cacheScreenData!).notifier).saveResult(isSkipped: isSkipped);
      }
      _currentQuizPosition = nextIndex;
      ref.read(quizInteractionNotifierProvider(screenData: _cacheScreenData!).notifier)
        ..resetForNextQuestion()
        ..updateQuizState(
          currentQuestionNumber: getNextQuizPosition,
          totalQuestions: _cacheQuizList.length,
          isLastItem: isLastItem,
        );
      state = AsyncData(_cacheQuizList[_currentQuizPosition]);
    } else {
      // Save result for last question if submitted
      if (state.value != null) {
        ref.read(quizResultNotifierProvider(screenData: _cacheScreenData!).notifier).saveResult(isSkipped: isSkipped);
      }
      // Trigger final save (navigation handled in QuizScreen)
      ref.read(quizResultNotifierProvider(screenData: _cacheScreenData!).notifier).saveResultData();
    }
  }

  Future<void> handleDataIntent(QuizIntent intent) async {
    if (intent is LoadQuiz) {
      await reload(screenData: intent.data);
    } else if (intent is NextQuestion) {
      _moveToNextQuestion();
    } else if (intent is SkipQuestion) {
      ref
          .read(quizInteractionNotifierProvider(screenData: _cacheScreenData!).notifier)
          .updateQuizStateWithInteraction();
      _moveToNextQuestion(isSkipped: true);
    }
  }

  QuizData get currentQuiz => _cacheQuizList[_currentQuizPosition];

  int get getNextQuizPosition => _currentQuizPosition + 1;

  bool get isLastItem => _currentQuizPosition + 1 == _cacheQuizList.length;

  int get totalQuiz => _cacheQuizList.length;
}
