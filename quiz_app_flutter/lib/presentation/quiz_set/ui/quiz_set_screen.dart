import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/intent/quiz_set_intent.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/notifiers/quiz_set_data_notifier.dart';
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
  StreamSubscription<NavigateToQuiz>? _navSubscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Replace 'math' with the desired quizTopic or pass null if not needed
      await ref
          .read(quizSetDataNotifierProvider(quizTopic: widget.quizTopic).notifier)
          .reload(quizTopic: widget.quizTopic);

      // Listen for navigation events
      _navSubscription = ref
          .read(quizSetDataNotifierProvider(quizTopic: widget.quizTopic).notifier)
          .navigationEvents
          .listen((event) {
            if (mounted) {
              context.push(QuizMasterDestinations.routeQuiz, extra: event.data);
            }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(quizSetDataNotifierProvider(quizTopic: widget.quizTopic));

    final title = uiState.when(
      loading: () => 'Loading...',
      data: (data) => data.title,
      error: (error, stackTrace) => 'Error',
    );

    return PlaceholderScaffold<QuizSetData>(
      toolbarConfig: QuizAppToolbar(title: title, onNavigationClick: () => Navigator.of(context).pop()),
      asyncValue: uiState,
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
                ref.read(quizSetDataNotifierProvider(quizTopic: widget.quizTopic).notifier).navigateToQuiz(section);
              },
              navigateToResultView: (fileName) {
                context.push(QuizMasterDestinations.routeResult, extra: fileName);
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
