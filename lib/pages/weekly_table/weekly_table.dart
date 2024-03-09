import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/pages/home/sections/this_week/lesson_week_day.dart';
import 'package:lesson_schedule/pages/home/sections/this_week/this_week_filter.dart';

class ThisWeekSection extends StatefulWidget {
  const ThisWeekSection(this.lessons, {super.key});

  final List<LessonEntity> lessons;

  @override
  State<ThisWeekSection> createState() => _ThisWeekSectionState();
}

class _ThisWeekSectionState extends State<ThisWeekSection> {

  int weekName = 5;

  callback(weekNameFromFilter) {
    setState(() {
      weekName = weekNameFromFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<LessonEntity> mondayLessons = [];
    List<LessonEntity> tuesdayLessons = [];
    List<LessonEntity> wednesdayLessons = [];
    List<LessonEntity> thursdayLessons = [];
    List<LessonEntity> fridayLessons = [];
    List<LessonEntity> saturdayLessons = [];
    List<LessonEntity> sundayLessons = [];

    List<LessonEntity> result = List.from(widget.lessons);

    result.sort();

    for (LessonEntity lesson in result){
      switch(lesson.dayOfWeek){
        case 1: {
          if(weekName != lesson.weekName){
            mondayLessons.add(lesson);
          }
        }
        case 2: {
          if(weekName != lesson.weekName) {
            tuesdayLessons.add(lesson);
          }
        }
        case 3: {
          if(weekName != lesson.weekName) {
            wednesdayLessons.add(lesson);
          }
        }
        case 4: {
          if(weekName != lesson.weekName) {
            thursdayLessons.add(lesson);
          }
        }
        case 5: {
          if(weekName != lesson.weekName) {
            fridayLessons.add(lesson);
          }
        }
        case 6: {
          if(weekName != lesson.weekName) {
            saturdayLessons.add(lesson);
          }
        }
        case 7: {
          if(weekName != lesson.weekName) {
            sundayLessons.add(lesson);
          }
        }
      }
    }

    List<List<LessonEntity>> allLessons = [];


    if(mondayLessons.isNotEmpty) {
      allLessons.add(mondayLessons);
    }

    if(tuesdayLessons.isNotEmpty) {
      allLessons.add(tuesdayLessons);
    }

    if(wednesdayLessons.isNotEmpty) {
      allLessons.add(wednesdayLessons);
    }

    if(thursdayLessons.isNotEmpty) {
      allLessons.add(thursdayLessons);
    }

    if(fridayLessons.isNotEmpty) {
      allLessons.add(fridayLessons);
    }

    if(saturdayLessons.isNotEmpty) {
      allLessons.add(saturdayLessons);
    }

    if(sundayLessons.isNotEmpty){
      allLessons.add(sundayLessons);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Group name"),
        bottom: ThisWeekTableFilter(weekName, callback),
      ),
      body: Container(
          child: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 8,
            childAspectRatio: 1/1.25,
            children: [
              for(List<LessonEntity> lessonEntities in allLessons) ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) => LessonWeekDay(lessonEntities),
              )
            ],
          )
      ),
    );
  }
}

