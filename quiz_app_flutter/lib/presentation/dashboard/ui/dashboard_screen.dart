import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/generated/locale_keys.g.dart';
import 'package:quiz_app_flutter/presentation/dashboard/intent/dashboard_nav_quiz_sets.dart';
import 'package:quiz_app_flutter/presentation/dashboard/notifiers/dashboard_data_notifier.dart';
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
  StreamSubscription<NavigateToQuizSets>? _navSubscription;

  @override
  void initState() {
    super.initState();

    // Delay intent call until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(dashboardDataNotifierProvider.notifier).reload();

      // Listen for navigation events
      _navSubscription = ref.read(dashboardDataNotifierProvider.notifier).navigationEvents.listen((event) {
        if (mounted) {
          // Save the topic in GoRouter state (optional) and navigate
          context.push(QuizMasterDestinations.routeQuizSet, extra: event.item.topic);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(dashboardDataNotifierProvider);

    return PlaceholderScaffold<DashboardData>(
      toolbarConfig: QuizAppToolbar(title: LocaleKeys.dashboard_title.tr()),
      asyncValue: uiState,
      padding: const EdgeInsets.all(16.0),
      onRetryClicked: () async {
        await ref.read(dashboardDataNotifierProvider.notifier).reload();
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
                  ref.read(dashboardDataNotifierProvider.notifier).navigateToQuizSets(NavigateToQuizSets(item));
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
