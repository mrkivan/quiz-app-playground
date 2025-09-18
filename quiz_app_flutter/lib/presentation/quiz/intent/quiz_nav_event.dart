import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_nav_event.freezed.dart';

@freezed
class QuizNavEvent with _$QuizNavEvent {
  const factory QuizNavEvent.navigateToResult(String key) = NavigateToResultEvent;
}
