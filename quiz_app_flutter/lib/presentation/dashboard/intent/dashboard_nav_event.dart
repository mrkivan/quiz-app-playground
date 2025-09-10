import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';

abstract class DashboardNavEvent {}

class DashboardNavEventNavigateToQuizSets extends DashboardNavEvent {
  final DashboardDataItem
  item; // Replace with your DashboardData.Item equivalent
  DashboardNavEventNavigateToQuizSets(this.item);
}

class DashboardNavigationNotifier extends StateNotifier<DashboardNavEvent?> {
  DashboardNavigationNotifier() : super(null);

  void navigate(DashboardNavEvent event) {
    state = event;
    // reset to null to avoid retrigger
    state = null;
  }
}
