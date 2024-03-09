import 'package:flutter/material.dart';

class ThisWeekTableFilter extends StatefulWidget implements PreferredSizeWidget {
  const ThisWeekTableFilter(this.weekName, this.callback, {super.key});

  final int weekName;
  final Function(int) callback;

  @override
  State<ThisWeekTableFilter> createState() => _ThisWeekTableFilterState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ThisWeekTableFilterState extends State<ThisWeekTableFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: SegmentedButton<int>(
        segments: const <ButtonSegment<int>>[
          ButtonSegment<int>(
              value: -1,
              label: Text('Üst həftə'),
              icon: Icon(Icons.arrow_upward)),
          ButtonSegment<int>(
              value: 5,
              label: Text('Ümumi'),
              icon: Icon(Icons.border_all)),
          ButtonSegment<int>(
              value: 1,
              label: Text('Alt həftə'),
              icon: Icon(Icons.arrow_downward)),
        ],
        selected: <int>{widget.weekName},
        onSelectionChanged: (Set<int> newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            widget.callback(newSelection.first);
          });
        },
      ),
    );
  }
}