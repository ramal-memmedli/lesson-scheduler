import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/subject.dart';
import 'package:lesson_schedule/pages/subjects/widgets/subject_card.dart';

class Subjects extends StatefulWidget {
  const Subjects(this.subjects, {super.key});

  final List<SubjectEntity> subjects;

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
          itemCount: widget.subjects.length,
          itemBuilder: (c, i) => SubjectCard(widget.subjects[i]),
        ),
      ),
    );
  }
}