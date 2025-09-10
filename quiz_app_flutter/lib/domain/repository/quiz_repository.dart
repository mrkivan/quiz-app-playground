import '../../core/resource.dart';
import '../entities/dashboard/dashboard_data.dart';
import '../entities/quiz/quiz_data.dart';
import '../entities/quiz_set/quiz_set_data.dart';

abstract class QuizRepository {
  Stream<Resource<DashboardData>> getDashboardData();

  Stream<Resource<QuizSetData>> getQuizListByTopic(String topic);

  Stream<Resource<List<QuizData>>> getQuizzesBySetAndTopic(String fileName);
}
