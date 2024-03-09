import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/widgets/lesson/lesson_card.dart';

class LessonOfDay extends StatelessWidget {
  const LessonOfDay(this.lessonOfDay, {super.key});

  final List<LessonEntity> lessonOfDay;

  @override
  Widget build(BuildContext context) {



    return Row(
      children: [
        LessonOfDayByWeekName(lessonOfDay)
      ],
    );
  }
}

class LessonOfDayByWeekName extends StatelessWidget {
  const LessonOfDayByWeekName(this.lesson, {super.key});

  final List<LessonEntity> lesson;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if(lesson.length > 1) {
      if(lesson[0].weekName == 1){
        return Container(
          width: screenWidth - 64,
          child: Column(
            children: [
              Flexible(
                child: LessonBox(lesson[0].time, lesson[0].subject.name, lesson[0].room.roomNo, lesson[0].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[0].teacher.name} ${lesson[0].teacher.surname}"),
              ),
              Divider(),
              Flexible(
                child: LessonBox(lesson[1].time, lesson[1].subject.name, lesson[1].room.roomNo, lesson[1].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[1].teacher.name} ${lesson[1].teacher.surname}"),
              )
            ],
          ),
        );
      }
      else if(lesson[0].weekName == -1){
        return Container(
          width: screenWidth - 64,
          child: Column(
            children: [
              Flexible(
                child: LessonBox(lesson[1].time, lesson[1].subject.name, lesson[1].room.roomNo, lesson[1].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[1].teacher.name} ${lesson[1].teacher.surname}"),
              ),
              Divider(),
              Flexible(
                child: LessonBox(lesson[0].time, lesson[0].subject.name, lesson[0].room.roomNo, lesson[0].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[0].teacher.name} ${lesson[0].teacher.surname}"),
              )
            ],
          ),
        );
      }
    }
    else if(lesson[0].weekName == 0){
      return Container(
        width: screenWidth - 64,
        child: LessonBox(lesson[0].time, lesson[0].subject.name, lesson[0].room.roomNo, lesson[0].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[0].teacher.name} ${lesson[0].teacher.surname}"),
      );
    }
    else if(lesson[0].weekName == 1){
      return Container(
        width: screenWidth - 64,
        child: Column(
          children: [
            Flexible(
              child: LessonBox(lesson[0].time, lesson[0].subject.name, lesson[0].room.roomNo, lesson[0].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[0].teacher.name} ${lesson[0].teacher.surname}"),
            ),
            Divider(),
            Flexible(
              child: Placeholder(),
            )
          ],
        ),
      );
    }
    else if(lesson[0].weekName == -1){
      return Container(
        width: screenWidth - 64,
        child: Column(
          children: [
            Flexible(
              child: Placeholder(),
            ),
            Divider(),
            Flexible(
              child: LessonBox(lesson[0].time, lesson[0].subject.name, lesson[0].room.roomNo, lesson[0].room.corpus.corpusNo, Colors.red.withAlpha(20), "${lesson[0].teacher.name} ${lesson[0].teacher.surname}"),
            ),
          ],
        ),
      );
    }
    else {
      return SizedBox.shrink();
    }

    return SizedBox.shrink();
  }
}
