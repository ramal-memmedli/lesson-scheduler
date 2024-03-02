import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable{
  final int ? id;
  final String ? name;

  const SubjectEntity(
      this.id,
      this.name,
      );

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      name,
    ];
  }
}