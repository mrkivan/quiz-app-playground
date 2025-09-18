import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';
import 'package:quiz_app_flutter/domain/usecase/quiz_set/get_quiz_set_list_usecase.dart';
import 'package:quiz_app_flutter/domain/usecase/result/get_result_data_usecase.dart';
import 'package:quiz_app_flutter/presentation/quiz/route/quiz_screen_data.dart';
import 'package:quiz_app_flutter/presentation/quiz_set/intent/quiz_set_intent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_set_data_notifier.g.dart';

@riverpod
class QuizSetDataNotifier extends _$QuizSetDataNotifier {
  final _navigationEventsController = StreamController<NavigateToQuiz>.broadcast();

  Stream<NavigateToQuiz> get navigationEvents => _navigationEventsController.stream;

  bool _isLoading = false; // Flag to prevent concurrent loads

  @override
  Future<QuizSetData> build({String? quizTopic}) async {
    // Ensure controller is closed when provider is destroyed
    ref.onDispose(() {
      _navigationEventsController.close();
    });
    return _loadQuizSetInternal(quizTopic ?? "");
  }

  /// Centralized load function (used on init + retry)
  Future<QuizSetData> _loadQuizSetInternal(String quizTopic) async {
    if (_isLoading) {
      debugPrint('QuizSetDataNotifier: Already loading, skipping...');
      return state.valueOrNull ??
          const QuizSetData(total: 0, title: '', topic: '', description: '', sectionId: 0, sections: []);
    }
    _isLoading = true;
    debugPrint('QuizSetDataNotifier: Starting load for topic: $quizTopic');

    try {
      final quizSetUseCase = await ref.watch(getQuizSetListUseCaseProvider.future);
      final quizSetData = await quizSetUseCase(quizTopic);
      debugPrint('QuizSetDataNotifier: Loaded quiz set with ${quizSetData.sections.length} sections');

      // Fetch results concurrently with limit
      final resultUseCase = await ref.read(getResultDataUseCaseProvider.future);
      final sections = quizSetData.sections;
      const int maxConcurrent = 15;

      // Chunk sections into batches of maxConcurrent
      List<List<QuizSetItem>> chunks = [];
      for (int i = 0; i < sections.length; i += maxConcurrent) {
        int end = (i + maxConcurrent).clamp(0, sections.length);
        chunks.add(sections.sublist(i, end));
      }
      debugPrint('QuizSetDataNotifier: Created ${chunks.length} chunks for ${sections.length} sections');

      // Process chunks sequentially, but concurrent within each chunk
      List<ResultData?> allResults = [];
      for (int chunkIndex = 0; chunkIndex < chunks.length; chunkIndex++) {
        final chunk = chunks[chunkIndex];
        debugPrint(
          'QuizSetDataNotifier: Processing chunk ${chunkIndex + 1}/${chunks.length} with ${chunk.length} sections',
        );

        List<Future<ResultData?>> futures =
            chunk.map((section) async {
              try {
                final key = section.fileName;
                debugPrint('QuizSetDataNotifier: Fetching result for key: $key');
                return await resultUseCase(key);
              } catch (e) {
                debugPrint('QuizSetDataNotifier: Error fetching result for ${section.fileName}: $e');
                return null;
              }
            }).toList();

        var chunkResults = await Future.wait(futures);
        allResults.addAll(chunkResults);
        debugPrint(
          'QuizSetDataNotifier: Completed chunk ${chunkIndex + 1}, got ${chunkResults.where((r) => r != null).length} non-null results',
        );
      }

      debugPrint(
        'QuizSetDataNotifier: Total results fetched: ${allResults.where((r) => r != null).length}/${allResults.length}',
      );

      // Update sections with previous results
      List<QuizSetItem> updatedSections = [];
      for (int i = 0; i < sections.length; i++) {
        final previousResult = allResults[i];
        updatedSections.add(sections[i].copyWith(previousResult: previousResult));
        if (previousResult != null) {
          debugPrint(
            'QuizSetDataNotifier: Assigned result to section ${sections[i].title}: ${previousResult.resultPercentage}%',
          );
        }
      }

      final updatedData = quizSetData.copyWith(sections: updatedSections);
      debugPrint('QuizSetDataNotifier: Load completed successfully');
      return updatedData;
    } catch (e, st) {
      debugPrint('QuizSetDataNotifier: Load failed: $e');
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  /// Public function for UI retry
  Future<void> reload({String? quizTopic}) async {
    if (_isLoading) {
      debugPrint('QuizSetDataNotifier: Reload skipped - already loading');
      return;
    }
    state = const AsyncLoading();
    try {
      final data = await _loadQuizSetInternal(quizTopic ?? "");
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> navigateToQuiz(QuizSetItem data) async {
    // Assuming QuizScreenData is defined elsewhere
    final quizScreenData = QuizScreenData(quizTitle: data.title, quizDescription: data.description, quizSection: data);
    _navigationEventsController.add(NavigateToQuiz(quizScreenData));
  }
}
