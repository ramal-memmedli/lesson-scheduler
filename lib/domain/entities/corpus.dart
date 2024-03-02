import 'package:equatable/equatable.dart';

class CorpusEntity extends Equatable{
  final int ? id;
  final int ? corpusNo;

  const CorpusEntity(
      this.id,
      this.corpusNo,
      );

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      corpusNo,
    ];
  }
}