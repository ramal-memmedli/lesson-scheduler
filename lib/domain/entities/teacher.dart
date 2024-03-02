import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable {
  final int ? id;
  final String ? name;
  final String ? surname;

  const TeacherEntity(
      this.id,
      this.name,
      this.surname);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      name,
      surname];
  }
}