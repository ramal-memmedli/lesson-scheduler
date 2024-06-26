import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/domain/entities/subject.dart';
import 'package:lesson_schedule/widgets/main_layout.dart';

const List<SubjectEntity> subjects = [];
const List<LessonEntity> lessons = [];

void main() {
  runApp(const LessonSchedule());
}

class LessonSchedule extends StatelessWidget {
  const LessonSchedule({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson Schedule',
      theme: ThemeData(
        /* light theme settings */
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent, brightness: Brightness.dark),
        /* dark theme settings */
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: const MainLayout(lessons, subjects),
    );
  }
}