import 'dart:convert';

import 'package:quiz_app_flutter/data/cache/cache_manager.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';

class SaveResultDataUseCase {
  final CacheManager cacheManager;

  SaveResultDataUseCase(this.cacheManager);

  Stream<void> call(String key, ResultData result) async* {
    final jsonString = json.encode(result.toJson());
    await cacheManager.saveResult(key, jsonString);
    yield null; // Emit null to indicate success (like Unit in Kotlin)
  }
}
