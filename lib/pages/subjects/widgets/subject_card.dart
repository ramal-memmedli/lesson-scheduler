import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/subject.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard(this.subject, {super.key});

  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.red.withAlpha(25),
        onTap: () {
          showModalBottomSheet(
            enableDrag: true,
              showDragHandle: true,
              barrierColor: Colors.black.withAlpha(10),
              context: context,
              builder: (BuildContext context){
                return SubjectContextMenu(subject);
              });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Flexible(
            child: Column(
              children: [
                Text(subject.name, textAlign: TextAlign.center,),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class SubjectContextMenu extends StatelessWidget {
  const SubjectContextMenu(this.subject, {super.key});

  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Flexible(
        child: Column(
          children: [
            Text(subject.name),
            Text("${subject.teacher.name} ${subject.teacher.surname}"),
            ElevatedButton(
              child: const Text('close'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

