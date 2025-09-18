import 'package:flutter/cupertino.dart';
import 'package:quiz_app_flutter/domain/usecase/result/get_result_data_usecase.dart';
import 'package:quiz_app_flutter/presentation/result/model/result_screen_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_notifier.g.dart';

@riverpod
class ResultNotifier extends _$ResultNotifier {
  @override
  Future<ResultScreenData?> build() async {
    return null;
  }

  Future<void> getResult(String key) async {
    debugPrint("------getResult $key");
    state = const AsyncLoading();
    try {
      final useCase = await ref.read(getResultDataUseCaseProvider.future);
      final result = await useCase(key);
      if (result == null) {
        state = AsyncError('Data not found', StackTrace.current);
      } else {
        final correctItems = result.resultItems.where((item) => item.result).toList();
        final skippedItems = result.resultItems.where((item) => item.isSkipped).toList();
        final incorrectItems = result.resultItems.where((item) => !item.result && !item.isSkipped).toList();

        state = AsyncData(
          ResultScreenData(
            quizTitle: result.quizTitle,
            quizDescription: result.quizDescription,
            correctItems: correctItems,
            skippedItems: skippedItems,
            incorrectItems: incorrectItems,
            totalCorrectItems: correctItems.length,
            totalSkippedItems: skippedItems.length,
            totalInCorrectItems: incorrectItems.length,
            totalQuestions: result.resultItems.length,
            resultPercentage: result.resultPercentage,
          ),
        );
      }
    } catch (e, stackTrace) {
      state = AsyncError(e.toString(), stackTrace);
    }
  }
}
