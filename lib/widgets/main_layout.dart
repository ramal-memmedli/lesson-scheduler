import 'package:flutter/material.dart';
import 'package:lesson_schedule/domain/entities/lesson.dart';
import 'package:lesson_schedule/domain/entities/subject.dart';
import 'package:lesson_schedule/main.dart';
import 'package:lesson_schedule/pages/home/home_page.dart';
import '../pages/subjects/subjects.dart';
import 'scheduler_app_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout(this.lessons, this.subjects, {super.key});

  final List<LessonEntity> lessons;
  final List<SubjectEntity> subjects;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPageIndex = 0;

  String _title = 'Cədvəl';
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SchedulerAppBar(_title),
        body: <Widget>[
          HomePage(widget.lessons),
          Subjects(widget.subjects)
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
            labelBehavior: labelBehavior,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {

                currentPageIndex = index;
                switch(currentPageIndex){
                  case 0: {
                    _title = 'Əsas';
                  }
                  break;
                  case 1: {
                    _title = 'Fənnlər';
                  }
                  break;
                }
              });
            },
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Əsas',
              ),
              NavigationDestination(
                icon: Icon(Icons.book_outlined),
                selectedIcon: Icon(Icons.book),
                label: 'Fənnlər',
              ),
            ]
        ),
    );
  }
}