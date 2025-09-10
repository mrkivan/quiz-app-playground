import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/di/flutter_riverpod.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/intent/quiz_set_intent.dart';
import 'package:quiz_app_flutter/presentation/route/app_router.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/placeholder_scaffold.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/quiz_app_top_appbar.dart';

import 'quiz_set_item_widget.dart';


class QuizSetScreen extends ConsumerStatefulWidget {
  final String quizTopic;

  const QuizSetScreen({super.key, required this.quizTopic});

  @override
  ConsumerState<QuizSetScreen> createState() => _QuizSetScreenState();
}

class _QuizSetScreenState extends ConsumerState<QuizSetScreen> {
  StreamSubscription<QuizSetNavEvent>? _navSubscription;

  @override
  void initState() {
    super.initState();

    // Trigger load after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(quizSetViewModelProvider.notifier)
          .handleIntent(LoadQuizSet(widget.quizTopic));
    });

    // Listen to navigation events
    _navSubscription = ref
        .read(quizSetViewModelProvider.notifier)
        .navigationEvents
        .listen((event) {
      if (event is NavigateToQuiz) {
        // Save data if needed and navigate
        /*Navigator.of(context).pushNamed(
          QuizMasterDestinations.routeQuiz,
          arguments: {NavKeys.dataKeyQuiz: event.data},
        );*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(quizSetViewModelProvider);
    final title = uiState.map(
      loading: (_) => 'Loading...',
      success: (s) => s.data.title,
      error: (_) => 'Error',
    );

    return PlaceholderScaffold<QuizSetData>(
      toolbarConfig: QuizAppToolbar(
        title: title,
        onNavigationClick: () => Navigator.of(context).pop(),
      ),
      uiState: uiState,
      bodyContent: (data) {
        final sections = data.sections;
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: sections.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final section = sections[index];
            return QuizSetScreenItemWidget(
              quizSetItemData: section,
              onItemClick: () {
                ref
                    .read(quizSetViewModelProvider.notifier);
                    //.handleIntent(NavigateToQuiz(section));
              },
              navigateToResultView: (fileName) {
                Navigator.of(context).pushNamed(
                  QuizMasterDestinations.routeResult,
                  arguments: {NavKeys.dataKeyResult: fileName},
                );
              },
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
