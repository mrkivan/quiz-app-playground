import 'package:flutter/material.dart';

class ResultRoute extends StatelessWidget {
  final String resultKey;

  const ResultRoute({super.key, required this.resultKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Result Screen for key: $resultKey')));
  }
}
