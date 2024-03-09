import 'package:equatable/equatable.dart';
import 'package:lesson_schedule/domain/entities/corpus.dart';

class RoomEntity extends Equatable{
  final int ? id;
  final int roomNo;
  final CorpusEntity corpus;

  const RoomEntity(
      this.id,
      this.roomNo,
      this.corpus
      );

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      roomNo,
      corpus
    ];
  }
}