import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/main.dart';
import 'package:lesson_schedule/pages/home/sections/today.dart';
import 'package:lesson_schedule/pages/weekly_table/weekly_table.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.lessons, {super.key});

  final List<LessonEntity> lessons;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodaySection(lessons),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return ThisWeekSection(lessons);
            },
          ));
        },
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}