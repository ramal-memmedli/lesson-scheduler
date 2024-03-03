import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
        /* dark theme settings */
        useMaterial3: true,
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SchedulerAppBar(),
        body: <Widget>[
          const HomeTabBar(),
          const Subjects()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
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
            ]
        )

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
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(kToolbarHeight + 25),
        child: ColoredBox(
          color: Colors.red.withAlpha(25),
          child: TabBar(

            dividerHeight: 0,
            dividerColor: Colors.transparent,
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                iconMargin: EdgeInsets.only(top:5, bottom: 5),
                icon: Icon(Icons.schedule),
                text: 'Bu gün',
              ),
              Tab(
                iconMargin: EdgeInsets.only(top:5, bottom: 5),
                icon: Icon(Icons.calendar_month),
                text: 'Bu həftə',
              ),
            ],
          ),
        )
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

class Subjects extends StatelessWidget {
  const Subjects({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fənnlər'),
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
    return Container(
      margin: const EdgeInsets.all(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: accentColor.withAlpha(25),
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
        child: Row(
          children: [
            RotatedBox(
                quarterTurns: 3,
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: accentColor.withAlpha(25),
                      ),
                      child: Center(
                        child: Text(
                          lessonTime,
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 10,
                      top: -110,
                      child: Opacity(
                        opacity: 0.04,
                        child: Icon(
                          Icons.schedule,
                          size: 256,
                        ),
                      ),
                    )
                  ],
                )
            ),
            Flexible(
              child: Column(
                children: [
                  LessonName(lessonName),
                  LessonTeacher(teacherFullName),
                  LessonRoom(roomNo)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonRoom extends StatelessWidget {
  const LessonRoom(this.lessonRoom, {super.key});

  final int lessonRoom;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.door_sliding),
        ColoredBox(
            color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(8),

            child: Text(lessonRoom.toString()),
          ),
        )
      ],
    );
  }
}

class LessonTeacher extends StatelessWidget {
  const LessonTeacher(this.teacherFullName, {super.key});

  final String teacherFullName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Text(
        teacherFullName,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 14
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
      padding: const EdgeInsets.all(32),
      child: Text(
        lessonName,
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}