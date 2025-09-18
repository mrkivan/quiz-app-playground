import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';

class ResultItemRow extends StatelessWidget {
  final ResultItem item;

  const ResultItemRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // AppCardDefaults.shape equivalent
      elevation: 4, // AppCardDefaults.elevation equivalent
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.question,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // SpacerSmallHeight equivalent
            Text(
              'Answer', // Replace with string resource if using localization
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ${item.correctAnswer}',
                    style: TextStyle(
                      color: item.result ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            if (item.explanation.isNotEmpty) ...[
              const SizedBox(height: 8), // SpacerSmallHeight equivalent
              Text(
                item.explanation,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }
}