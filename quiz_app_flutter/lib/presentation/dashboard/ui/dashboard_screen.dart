import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/di/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_intent.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_nav_event.dart';
import 'package:quiz_app_flutter/presentation/route/app_router.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/placeholder_scaffold.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/quiz_app_top_appbar.dart';

import 'dashboard_item_widget.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  StreamSubscription<DashboardNavEvent>? _navSubscription;

  @override
  void initState() {
    super.initState();

    // Delay intent call until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(dashboardViewModelProvider.notifier)
          .handleIntent(LoadDashboard());

      // Listen for navigation events
      _navSubscription = ref
          .read(dashboardViewModelProvider.notifier)
          .navigationEvents
          .listen((event) {
            if (event is DashboardNavEventNavigateToQuizSets && mounted) {
              // Save the topic in GoRouter state (optional) and navigate
              context.push(
                QuizMasterDestinations.routeQuizSet,
                extra: event.item.topic,
              );
            }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(dashboardViewModelProvider);

    return PlaceholderScaffold<DashboardData>(
      toolbarConfig: QuizAppToolbar(title: 'Quiz App'),
      uiState: uiState,
      padding: const EdgeInsets.all(16.0),
      onRetryClicked: () async {
        await ref
            .read(dashboardViewModelProvider.notifier)
            .handleIntent(LoadDashboard());
      },
      bodyContent: (dashboardData) {
        // Ensure dashboardData is non-null
        final items = dashboardData.items;
        if (items.isEmpty) {
          return const Center(child: Text('No items found'));
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: DashboardItemWidget(
                item: item,
                onClick: () {
                  ref
                      .read(dashboardViewModelProvider.notifier)
                      .handleIntent(NavigateToQuizSets(item));
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _navSubscription?.cancel();
    super.dispose();
  }
}
