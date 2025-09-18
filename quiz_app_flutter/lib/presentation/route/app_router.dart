import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/presentation/dashboard/route/dashboard_route.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_route.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/route/quiz_set_route.dart';
import 'package:quiz_app_flutter/presentation/result/route/result_route.dart';

/// Routes
class QuizMasterDestinations {
  static const routeHome = '/dashboard';
  static const routeQuizSet = '/quiz_list';
  static const routeQuiz = '/quiz';
  static const routeResult = '/result';

  static const argQuizId = 'quizId';
}

/// Keys for passing data
class NavKeys {
  static const dataKeyDashboard = 'dashboard_item';
  static const dataKeyQuiz = 'quiz_data';
  static const dataKeyResult = 'result_key';
}

/// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: QuizMasterDestinations.routeHome,
  routes: [
    GoRoute(path: QuizMasterDestinations.routeHome, builder: (context, state) => const DashboardRoute()),
    GoRoute(
      path: QuizMasterDestinations.routeQuizSet,
      builder: (context, state) {
        final quizTopic = state.extra as String? ?? '';
        return QuizSetRoute(quizTopic: quizTopic);
      },
    ),
    GoRoute(
      path: QuizMasterDestinations.routeQuiz,
      builder: (context, state) {
        final screenData = state.extra as QuizScreenData?;
        return QuizRoute(quizId: -1, screenData: screenData);
      },
    ),
    GoRoute(
      path: QuizMasterDestinations.routeResult,
      builder: (context, state) {
        final resultKey = state.extra as String? ?? '';
        debugPrint("-------------- ResultRoute $resultKey");
        return ResultRoute(resultKey: resultKey);
      },
    ),
  ],
);
