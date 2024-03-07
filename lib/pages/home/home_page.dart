import 'package:flutter/material.dart';
import 'package:lesson_schedule/pages/home/sections/today.dart';
import 'package:lesson_schedule/pages/home/sections/this_week.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          child: TabBar(
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          TodaySection(),
          ThisWeekSection(),
        ],
      ),
    );
  }
}