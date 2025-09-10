import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/presentation/route/app_router.dart';

void main() {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Run app with Riverpod ProviderScope for DI
  runApp(ProviderScope(child: QuizMasterApp()));
}

class QuizMasterApp extends ConsumerWidget {
  QuizMasterApp({super.key});

  // Initialize GoRouter
  final _router = router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'QuizMaster',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _router,
    );
  }
}
