import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/di/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/domain/usecase/quiz_set/getquizsetlist_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/intent/quiz_set_intent.dart';
import 'package:quiz_app_flutter/presentation/utils/state/quiz_app_ui_state.dart';
import 'package:quiz_app_flutter/presentation/utils/viewmodel/base_viewModel.dart';

class QuizSetViewModel extends BaseViewModel<QuizSetData> {
  final Ref _ref;

  final _navigationEventsController =
      StreamController<QuizSetNavEvent>.broadcast();

  Stream<QuizSetNavEvent> get navigationEvents =>
      _navigationEventsController.stream;

  QuizSetViewModel(this._ref) : super() {
    setLoading();
  }

  Future<void> handleIntent(QuizSetIntent intent) async {
    if (intent is LoadQuizSet) {
      await loadQuizSet(intent.quizTopic);
    } else if (intent is NavigateToQuiz) {
      //_navigateToQuiz(intent.data);
    }
  }

  Future<void> loadQuizSet(String? quizTopic) async {
    setLoading();

    try {
      final useCase = await _ref.read(getQuizSetListUseCaseProvider.future);

      useCase(quizTopic ?? "").listen((resource) {
        resource.when(
          success: (data) => setSuccess(data),
          failure: (e) => setError(e.toString()),
          loading: () => setLoading(),
        );
      });
    } catch (e) {
      setError(e.toString());
    }

  }

  void _navigateToQuiz(QuizSetData data) {
    /*final quizScreenData = QuizScreenData(
      quizTitle: data.title,
      quizDescription: data.description,
      quizSection: data,
    );
    _navigationEventsController.add(QuizSetNavEventNavigateToQuiz(quizScreenData));*/
  }

  @override
  void dispose() {
    _navigationEventsController.close();
    super.dispose();
  }
}
