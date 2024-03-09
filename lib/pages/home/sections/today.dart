import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/main.dart';
import 'package:lesson_schedule/widgets/lesson/lesson_card.dart';

class TodaySection extends StatefulWidget {
  const TodaySection(this.lessons, {super.key});

  final List<LessonEntity> lessons;

  @override
  State<TodaySection> createState() => _TodaySectionState();
}

class _TodaySectionState extends State<TodaySection> {

  List<LessonEntity> sortedLessons = List.from(lessons);

  int getOppositeWeekName(){
    DateTime pivotDate = DateTime(2024, 2, 16);
    DateTime thisWeek = DateTime.now();

    int totalDiff = thisWeek.difference(pivotDate).inDays;

    int weekDiff = 0;

    int dayDiff = 0;

    if(totalDiff < 7){
      dayDiff = totalDiff;
    }else {
      weekDiff = (totalDiff / 7).ceil();
      dayDiff = totalDiff - weekDiff * 7;
    }

    if(weekDiff % 2 == 0){
      return -1;
    }
    else{
      return 1;
    }
  }

  List<LessonEntity> lessonsOfToday = <LessonEntity>[];

  void setLessonsOfToday(){
    for(LessonEntity lesson in sortedLessons){
      if(lesson.dayOfWeek == DateTime.now().weekday && lesson.weekName != getOppositeWeekName()){
        lessonsOfToday.add(lesson);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    lessonsOfToday.clear();
    sortedLessons.sort();
    setLessonsOfToday();



    return Scaffold(
      body: GridView.count(
        mainAxisSpacing: 8,
        crossAxisCount: 1,
        childAspectRatio: 1.5/1,
        children: [
          for(LessonEntity lesson in lessonsOfToday) Container(child: LessonBox(lesson.time, lesson.subject.name, lesson.room.roomNo, lesson.room.corpus.corpusNo, Colors.red, "${lesson.teacher.name} ${lesson.teacher.surname}")),
        ],
      ),
    );
  }
}