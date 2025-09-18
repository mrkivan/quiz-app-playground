import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app_flutter/presentation/result/model/result_screen_data.dart';
import 'package:quiz_app_flutter/presentation/result/notifiers/result_notifier.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/circular_percentage_progress.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/placeholder_scaffold.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/quiz_app_top_appbar.dart';
import 'result_item_row.dart';

class ResultScreen extends ConsumerStatefulWidget {
  final String resultKey;

  const ResultScreen({super.key, required this.resultKey});

  @override
  ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends ConsumerState<ResultScreen> with TickerProviderStateMixin {
  int selectedTabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(resultNotifierProvider.notifier).getResult(widget.resultKey);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize TabController after dependencies are available
    final uiState = ref.watch(resultNotifierProvider);
    final tabCount = uiState.when(
      data: (data) {
        if (data == null) return 0;
        return [
          if (data.totalCorrectItems > 0) 1,
          if (data.totalSkippedItems > 0) 1,
          if (data.totalInCorrectItems > 0) 1,
        ].length;
      },
      loading: () => 0,
      error: (_, __) => 0,
    );
    _tabController = TabController(length: tabCount, vsync: this, initialIndex: selectedTabIndex);
    _tabController.addListener(() {
      if (_tabController.index != selectedTabIndex) {
        setState(() {
          selectedTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(resultNotifierProvider);

    return PlaceholderScaffold(
      toolbarConfig: QuizAppToolbar(
        title: uiState.when(
          data: (data) => data?.quizTitle ?? '',
          loading: () => 'Loading',
          error: (error, _) => 'Error',
        ),
        navigationIcon: Icons.arrow_back,
        navigationIconContentDescription: 'Back',
        onNavigationClick: () {
          context.pop();
        },
      ),
      asyncValue: uiState,
      onRetryClicked: () {
        ref.read(resultNotifierProvider.notifier).getResult(widget.resultKey);
      },
      bodyContent: (data) {
        final currentTabTitle = 'Current (${data?.totalCorrectItems})';
        final skippedTabTitle = 'Skipped (${data?.totalSkippedItems})';
        final incorrectTabTitle = 'Incorrect (${data?.totalInCorrectItems})';

        final tabs = [
          if (data != null && data.totalCorrectItems > 0) (currentTabTitle, data.correctItems),
          if (data != null && data.totalSkippedItems > 0) (skippedTabTitle, data.skippedItems),
          if (data != null && data.totalInCorrectItems > 0) (incorrectTabTitle, data.incorrectItems),
        ];

        return Container(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ResultReportCard(data: data!)),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    TabBar(controller: _tabController, tabs: tabs.map((tab) => Tab(text: tab.$1)).toList()),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final filteredItems = tabs.isNotEmpty ? tabs[selectedTabIndex].$2 : [];
                  final item = filteredItems[index];
                  return ResultItemRow(item: item);
                }, childCount: tabs.isNotEmpty ? tabs[selectedTabIndex].$2.length : 0),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ResultReportCard extends StatelessWidget {
  final ResultScreenData data;

  const ResultReportCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.quizDescription != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              data.quizDescription!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Questions: ${data.totalQuestions}'),
                    const SizedBox(height: 8),
                    Text('Incorrect Answers: ${data.totalInCorrectItems}'),
                  ],
                ),
                CircularPercentageProgress(
                  progress: data.resultPercentage / 100.0,
                  size: 48.0,
                  strokeWidth: 4.0,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
