import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        brightness: Brightness.light,
        /* light theme settings */
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SchedulerAppBar(),
      body: HomeTabBar(),
      bottomNavigationBar: NavigationExample(),
    );
  }
}

class SchedulerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SchedulerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Scheduler'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Settings'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is settings page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}
class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
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
      ],
    );
  }
}



class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _HomeTabBarExampleState extends State<HomeTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  String getCurrentDateForHeader(){
    DateTime dateTime = DateTime.now();
    String currentTime = DateTime(dateTime.year, dateTime.month, dateTime.day).toString();
    return currentTime;
  }
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentDateForHeader()),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.schedule),
              text: 'Bu gün',
            ),
            Tab(
              icon: Icon(Icons.calendar_month),
              text: 'Bu həftə',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Column(
            children: <Widget>[
              Expanded(child: LessonBox('18:30', 'Əməliyyat sistemlərinin arxitekturası', 613, 6, Colors.red, 'Ramal')),
              Expanded(child: LessonBox('20:00', 'NoSQL verilənlər bazalarının idarəetmə sistemləri', 401, 1, Colors.green, 'Ramal'))
            ],
          ),
          Column(
            children: [
              Text("It's rainy here")
            ],
          ),
        ],
      ),
    );
  }
}



class LessonBox extends StatelessWidget {
  const LessonBox(this.lessonTime, this.lessonName, this.roomNo, this.corpusNo, this.accentColor, this.teacherFullName, {super.key});

  final String lessonTime;
  final String lessonName;
  final int roomNo;
  final int corpusNo;
  final Color accentColor;
  final String teacherFullName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: accentColor.withAlpha(30),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return SizedBox(
                height: 128,
                child: Center(
                  child: ElevatedButton(
                    child: const Text('close'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            });
      },
      child: Expanded(
        child: Row(
          children: [
            RotatedBox(
                quarterTurns: 3,
                child: Container(
                  height: 80,
                  width: double.infinity,
                  color: accentColor.withAlpha(30),
                  child: Center(
                    child: Text(
                      lessonTime,
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                )
            ),
            Expanded(
              child: Column(
                children: [
                  LessonName(lessonName),
                  LessonTeacher(teacherFullName)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonTeacher extends StatelessWidget {
  const LessonTeacher(this.teacherFullName, {super.key});

  final String teacherFullName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Expanded(
        child: Text(
          teacherFullName,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14
          ),
        ),
      ),
    );
  }
}


class LessonName extends StatelessWidget {
  const LessonName(this.lessonName, {super.key});

  final String lessonName;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Expanded(
        child: Text(
          lessonName,
          style: TextStyle(
              fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}