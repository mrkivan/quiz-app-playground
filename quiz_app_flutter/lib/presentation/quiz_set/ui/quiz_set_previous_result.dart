import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';

class PreviousResultButton extends StatelessWidget {
  final ResultData? resultData;
  final VoidCallback navigateToResultView;

  const PreviousResultButton({super.key, required this.resultData, required this.navigateToResultView});

  @override
  Widget build(BuildContext context) {
    if (resultData == null) return const SizedBox.shrink();

    return Column(
      children: [
        const SizedBox(height: 24), // Equivalent to SpacerLargeHeight
        ElevatedButton(
          onPressed: navigateToResultView,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 0), // Fill max width
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Previous Result: ${resultData!.resultPercentage}%'), const Icon(Icons.arrow_forward)],
          ),
        ),
      ],
    );
  }
}
