import 'dart:async';

import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/domain/usecase/dashboard/get_dashboard_data_usecase.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_nav_quiz_sets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_data_notifier.g.dart';

@riverpod
class DashboardDataNotifier extends _$DashboardDataNotifier {
  final _navigationEventsController = StreamController<NavigateToQuizSets>.broadcast();

  Stream<NavigateToQuizSets> get navigationEvents => _navigationEventsController.stream;

  @override
  Future<DashboardData> build() async {
    // ensure controller is closed when provider is destroyed
    ref.onDispose(() {
      _navigationEventsController.close();
    });
    return _loadDashboardInternal();
  }

  /// Centralized load function (used on init + retry)
  Future<DashboardData> _loadDashboardInternal() async {
    final useCase = await ref.watch(getDashboardDataUseCaseProvider.future);
    return await useCase();
  }

  /// Public function for UI retry
  Future<void> reload() async {
    state = const AsyncLoading();
    try {
      final data = await _loadDashboardInternal();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> navigateToQuizSets(NavigateToQuizSets intent) async {
    _navigationEventsController.add(intent);
  }
}
