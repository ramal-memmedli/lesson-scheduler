import 'package:flutter/material.dart';
import 'package:lesson_schedule/pages/home/home_page.dart';
import '../pages/subjects/subjects.dart';
import 'scheduler_app_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

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
          const HomePage(),
          const Subjects()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
            labelBehavior: labelBehavior,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
                switch(currentPageIndex){
                  case 0: {
                    _title = 'Cədvəl';
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
                icon: Icon(Icons.calendar_view_month),
                label: 'Cədvəl',
              ),
              NavigationDestination(
                icon: Icon(Icons.subject),
                label: 'Fənnlər',
              ),
            ]
        ),
    );
  }
}