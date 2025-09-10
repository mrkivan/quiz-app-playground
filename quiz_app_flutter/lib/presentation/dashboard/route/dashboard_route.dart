import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/presentation/dashboard/ui/dashboard_screen.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardScreen());
  }
}
