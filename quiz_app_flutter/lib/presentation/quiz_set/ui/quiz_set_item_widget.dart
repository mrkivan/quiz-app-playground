import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/domain/entities/quiz_set/quiz_set_data.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/core/app_spacers.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/app_text_styles.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/base_card_view.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/circle_with_number.dart';

import 'quiz_set_previous_result.dart';

class QuizSetScreenItemWidget extends StatelessWidget {
  final QuizSetItem quizSetItemData;
  final VoidCallback onItemClick;
  final void Function(String fileName) navigateToResultView;

  const QuizSetScreenItemWidget({
    super.key,
    required this.quizSetItemData,
    required this.onItemClick,
    required this.navigateToResultView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Stack(
        clipBehavior: Clip.none, // Allow the circle to overflow
        children: [
          // Row to make card expand to full width minus the circle
          Row(
            children: [
              const SizedBox(width: 20), // Space for the circle
              Expanded(
                child: BaseCardView(
                  padding: const EdgeInsets.fromLTRB(24, 12, 16, 12),
                  onClick: onItemClick,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextStyles.quizBodyTitle(quizSetItemData.title),
                      AppSpacers.smallHeight,
                      AppTextStyles.quizBodyDesc(quizSetItemData.description),
                      if (quizSetItemData.previousResult != null) ...[
                        AppSpacers.smallHeight,
                        PreviousResultButton(
                          resultData: quizSetItemData.previousResult!,
                          navigateToResultView: () => navigateToResultView(quizSetItemData.fileName),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Circle overlapping on the left
          Positioned(left: 0, top: 0, bottom: 0, child: CircleWithNumber(number: quizSetItemData.position)),
        ],
      ),
    );
  }
}
