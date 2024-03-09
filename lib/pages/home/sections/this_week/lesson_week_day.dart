import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/pages/home/sections/this_week/lesson_card_of_day.dart';
import 'dart:math' as math;

class LessonWeekDay extends StatelessWidget {
  const LessonWeekDay(this.lessonsOfDay, {super.key});

  final List<LessonEntity> lessonsOfDay;

  @override
  Widget build(BuildContext context) {
    String weekDayOfLessonString = "- gün";

    switch(lessonsOfDay[0].dayOfWeek){
      case 1: {
        weekDayOfLessonString = 'I gün';
      }
      break;
      case 2: {
        weekDayOfLessonString = 'II gün';
      }
      break;
      case 3: {
        weekDayOfLessonString = 'III gün';
      }
      break;
      case 4: {
        weekDayOfLessonString = 'IV gün';
      }
      break;
      case 5: {
        weekDayOfLessonString = 'V gün';
      }
      break;
      case 6: {
        weekDayOfLessonString = 'VI gün';
      }
      break;
      case 7: {
        weekDayOfLessonString = 'VII gün';
      }
      break;
    }

    List<LessonEntity> copyLessons = List.from(lessonsOfDay);

    Set<String> distinctLessonTimes = {};
    copyLessons.retainWhere((x) => distinctLessonTimes.add(x.time));

    List<List<LessonEntity>> organizedLessons = [];

    for(String time in distinctLessonTimes){
      List<LessonEntity> lessons = [];

      for(LessonEntity lesson in lessonsOfDay){
        if(time == lesson.time){
          lessons.add(lesson);
        }
      }

      organizedLessons.add(lessons);
    }

    return Container(
      child: Row(
        children: [
          RotatedBox(
              quarterTurns: 3,
              child: Stack(
                children: [
                  Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withAlpha(40),
                    ),
                    child: Center(
                      child: Text(
                        weekDayOfLessonString,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: -15,
                    top: -110,
                    child: Opacity(
                      opacity: 0.04,
                      child: Icon(
                        Icons.weekend,
                        size: 256,
                      ),
                    ),
                  )
                ],
              )
          ),
          for(int i = 0; i < organizedLessons.length; i++ ) LessonOfDay(organizedLessons[i]),
        ],
      ),
    );
  }
}


