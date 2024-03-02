import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable{
  final int ? id;
  final int ? roomNo;
  final int ? corpusId;

  const RoomEntity(
      this.id,
      this.roomNo,
      this.corpusId
      );

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      roomNo,
      corpusId
    ];
  }
}