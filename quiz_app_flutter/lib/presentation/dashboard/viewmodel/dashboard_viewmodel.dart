import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/di/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_intent.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_nav_event.dart';
import 'package:quiz_app_flutter/presentation/utils/viewmodel/base_viewModel.dart';

class DashboardViewModel extends BaseViewModel<DashboardData> {
  final Ref _ref;

  // StreamController for navigation events
  final _navigationEventsController =
      StreamController<DashboardNavEvent>.broadcast();
  Stream<DashboardNavEvent> get navigationEvents =>
      _navigationEventsController.stream;

  DashboardViewModel(this._ref) : super() {
    setLoading();
    // automatically load dashboard when ViewModel is created
    handleIntent(LoadDashboard());
  }

  Future<void> handleIntent(DashboardIntent intent) async {
    if (intent is LoadDashboard) {
      await loadDashboard();
    } else if (intent is NavigateToQuizSets) {
      _navigationEventsController.add(
        DashboardNavEventNavigateToQuizSets(intent.item),
      );
    }
  }

  Future<void> loadDashboard() async {
    setLoading();

    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        setError('No internet connection');
        return;
      }

      final useCase = await _ref.read(getDashboardDataUseCaseProvider.future);

      useCase().listen((resource) {
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

  @override
  void dispose() {
    _navigationEventsController.close();
    super.dispose();
  }
}
