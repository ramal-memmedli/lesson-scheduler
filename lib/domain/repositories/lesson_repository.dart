import 'package:lesson_schedule/domain/entities/lesson.dart';
import '../../core/resources/data_state.dart';

abstract class LessonRepository{
  Future<DataState<LessonEntity>> getLessons();
}