import 'dart:convert';

import 'package:quiz_app_flutter/data/cache/cache_manager.dart';
import 'package:quiz_app_flutter/domain/entities/result/result_data.dart';

class GetResultDataUseCase {
  final CacheManager cacheManager;

  GetResultDataUseCase(this.cacheManager);

  Stream<ResultData?> call(String key) async* {
    final jsonString = cacheManager.getResult(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      yield ResultData.fromJson(jsonMap);
    } else {
      yield null;
    }
  }
}
