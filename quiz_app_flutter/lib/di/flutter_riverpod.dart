import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/domain/usecase/dashboard/getdashboarddata_usecase.dart';
import 'package:quiz_app_flutter/domain/usecase/quiz/getquizdata_bysetandtopic_usecase.dart';
import 'package:quiz_app_flutter/domain/usecase/quiz_set/getquizsetlist_usecase.dart';
import 'package:quiz_app_flutter/domain/usecase/result/getresultdata_usecase.dart';
import 'package:quiz_app_flutter/domain/usecase/result/saveresultdata_usecase.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_nav_event.dart';
import 'package:quiz_app_flutter/presentation/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/viewmodel/quiz_set_viewmodel.dart';
import 'package:quiz_app_flutter/presentation/utils/state/quiz_app_ui_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/cache/cache_manager.dart';
import '../data/repository/quiz_repository_impl.dart';
import '../data/service/quiz_api.dart';
import '../domain/repository/quiz_repository.dart';
import 'network_module.dart';

// 1️⃣ SharedPreferences
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

// 2️⃣ CacheManager (depends on SharedPreferences)
final cacheManagerProvider = FutureProvider<CacheManager>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return CacheManager(prefs);
});

// 3️⃣ QuizRepository (depends on CacheManager)
final quizRepositoryProvider = FutureProvider<QuizRepository>((ref) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  final dio = ref.watch(dioProvider);
  final api = QuizApi(dio);
  return QuizRepositoryImpl(api: api, cache: cacheManager);
});

// 4️⃣ UseCases (all depend on QuizRepository or CacheManager)
final getDashboardDataUseCaseProvider = FutureProvider<GetDashboardDataUseCase>(
  (ref) async {
    final repository = await ref.watch(quizRepositoryProvider.future);
    return GetDashboardDataUseCase(repository);
  },
);

final getQuizDataBySetAndTopicUseCaseProvider =
    FutureProvider<GetQuizDataBySetAndTopicUseCase>((ref) async {
      final repository = await ref.watch(quizRepositoryProvider.future);
      return GetQuizDataBySetAndTopicUseCase(repository);
    });

final getQuizSetListUseCaseProvider = FutureProvider<GetQuizSetListUseCase>((
  ref,
) async {
  final repository = await ref.watch(quizRepositoryProvider.future);
  return GetQuizSetListUseCase(repository);
});

final getResultDataUseCaseProvider = FutureProvider<GetResultDataUseCase>((
  ref,
) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  return GetResultDataUseCase(cacheManager);
});

final saveResultDataUseCaseProvider = FutureProvider<SaveResultDataUseCase>((
  ref,
) async {
  final cacheManager = await ref.watch(cacheManagerProvider.future);
  return SaveResultDataUseCase(cacheManager);
});

// 5️⃣ Dashboard ViewModel
final dashboardViewModelProvider =
    StateNotifierProvider<DashboardViewModel, QuizAppUiState<DashboardData>>(
      (ref) => DashboardViewModel(ref),
    );

// 6️⃣ Navigation Events
final dashboardNavigationProvider =
    StateNotifierProvider<DashboardNavigationNotifier, DashboardNavEvent?>(
      (ref) => DashboardNavigationNotifier(),
    );


final quizSetViewModelProvider =
StateNotifierProvider<QuizSetViewModel, QuizAppUiState<QuizSetData>>(
      (ref) => QuizSetViewModel(ref),
);