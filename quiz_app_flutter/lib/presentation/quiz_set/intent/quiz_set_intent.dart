// intents
abstract class QuizSetIntent {}

class LoadQuizSet extends QuizSetIntent {
  final String? quizTopic;
  LoadQuizSet(this.quizTopic);
}

class NavigateToQuiz extends QuizSetIntent {
  /*final QuizSetSectionItem data;
  NavigateToQuiz(this.data);*/
}

// navigation events
abstract class QuizSetNavEvent {}

class QuizSetNavEventNavigateToQuiz extends QuizSetNavEvent {
  /*final QuizScreenData data;
  QuizSetNavEventNavigateToQuiz(this.data);*/
}
