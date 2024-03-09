import 'package:equatable/equatable.dart';
import 'package:lesson_schedule/domain/entities/room.dart';
import 'package:lesson_schedule/domain/entities/subject.dart';
import 'package:lesson_schedule/domain/entities/teacher.dart';

class LessonEntity extends Equatable implements Comparable<LessonEntity>{
  final int ? id;
  final TeacherEntity teacher;
  final RoomEntity room;
  final SubjectEntity subject;
  final int weekName; //-1: alt həftə, 0: hər həftə, 1: üst həftə
  final int dayOfWeek;
  final String time;

  const LessonEntity(
      this.id,
      this.teacher,
      this.room,
      this.subject,
      this.weekName,
      this.dayOfWeek,
      this.time
      );

  @override
  int compareTo(LessonEntity entity) => time.compareTo(entity.time);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      teacher,
      room,
      subject,
      weekName,
      dayOfWeek,
      time
    ];
  }
}