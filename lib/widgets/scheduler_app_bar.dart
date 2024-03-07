import 'package:flutter/material.dart';
import 'package:lesson_schedule/pages/settings/settings.dart';

class SchedulerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SchedulerAppBar(this.title, {super.key});

  final String title;

  @override
  State<SchedulerAppBar> createState() => _SchedulerAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SchedulerAppBarState extends State<SchedulerAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
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
                return const SettingsPage();
              },
            ));
          },
        ),
      ],
    );
  }
}