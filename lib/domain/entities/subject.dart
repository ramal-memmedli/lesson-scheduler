import 'package:equatable/equatable.dart';
import 'package:lesson_schedule/domain/entities/teacher.dart';

class SubjectEntity extends Equatable{
  final int ? id;
  final String name;
  final TeacherEntity teacher;

  const SubjectEntity(
      this.id,
      this.name,
      this.teacher,
      );

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      name,
      teacher,
    ];
  }
}