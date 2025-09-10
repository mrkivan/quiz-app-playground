import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_app_ui_state.freezed.dart';

@freezed
class QuizAppUiState<T> with _$QuizAppUiState<T> {
  const factory QuizAppUiState.loading() = _Loading<T>;
  const factory QuizAppUiState.success(T data) = _Success<T>;
  const factory QuizAppUiState.error(String message) = _Error<T>;
}
