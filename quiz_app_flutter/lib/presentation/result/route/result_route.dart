import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/presentation/result/ui/result_screen.dart';

class ResultRoute extends StatelessWidget {
  final String resultKey;

  const ResultRoute({super.key, required this.resultKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResultScreen(key: key, resultKey: resultKey));
  }
}
