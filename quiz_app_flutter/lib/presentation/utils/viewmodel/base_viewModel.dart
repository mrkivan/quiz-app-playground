import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/presentation/utils/state/quiz_app_ui_state.dart';

class BaseViewModel<T> extends StateNotifier<QuizAppUiState<T>> {
  BaseViewModel() : super(QuizAppUiState<T>.loading()) {
    if (kDebugMode) {
      print('BaseViewModel initialized with Loading state');
    }
  }

  void setLoading() {
    state = QuizAppUiState<T>.loading();
  }

  void setSuccess(T data) {
    state = QuizAppUiState<T>.success(data);
  }

  void setError(String message) {
    if (kDebugMode) {
      print("BaseViewModel error message $message");
    }
    state = QuizAppUiState<T>.error(errorDataNotFound);
  }

  static const String errorDataNotFound = 'Data not found';
}
