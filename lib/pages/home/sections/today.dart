import 'package:flutter/material.dart';
import 'package:lesson_schedule/widgets/lesson/lesson_card.dart';

class TodaySection extends StatelessWidget {
  const TodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: const Column(
        children: <Widget>[
          Flexible(child: LessonBox('18:30', 'Əməliyyat sistemlərinin arxitekturası', 613, 6, Colors.red, 'Əliyeva Kəmalə')),
          SizedBox(height: 8,),
          Flexible(child: LessonBox('20:00', 'NoSQL verilənlər bazalarının idarəetmə sistemləri', 401, 1, Colors.green, 'Cəfərov Nizami'))
        ],
      ),
    );
  }
}