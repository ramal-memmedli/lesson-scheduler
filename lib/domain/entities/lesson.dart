import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable{
  final int ? id;
  final int ? teacherId;
  final int ? roomId;
  final int ? subjectId;
  final int ? weekName;

  const LessonEntity(
      this.id,
      this.teacherId,
      this.roomId,
      this.subjectId,
      this.weekName
      );

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      teacherId,
      roomId,
      subjectId,
      weekName
    ];
  }
}