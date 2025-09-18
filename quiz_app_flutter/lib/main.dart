import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_flutter/presentation/route/app_router.dart';
import 'package:quiz_app_flutter/presentation/utils/provider_observer.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Localization
  await EasyLocalization.ensureInitialized();

  // Run app with Riverpod ProviderScope for DI
  runApp(ProviderScope(child: QuizMasterApp()));
  runApp(
    ProviderScope(
      observers: [AppObserver()],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('bn')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        useOnlyLangCode: true,
        child: QuizMasterApp(),
      ),
    ),
  );
}

class QuizMasterApp extends ConsumerWidget {
  QuizMasterApp({super.key});

  // Initialize GoRouter
  final _router = router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(title: 'QuizMaster', theme: ThemeData(primarySwatch: Colors.blue), routerConfig: _router);
  }
}
