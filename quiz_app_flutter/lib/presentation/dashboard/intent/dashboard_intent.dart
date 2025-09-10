import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';

abstract class DashboardIntent {}

class LoadDashboard extends DashboardIntent {}

class NavigateToQuizSets extends DashboardIntent {
  final DashboardDataItem
  item; // Replace with your DashboardData.Item equivalent
  NavigateToQuizSets(this.item);
}
