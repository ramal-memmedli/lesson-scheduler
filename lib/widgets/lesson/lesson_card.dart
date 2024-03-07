import 'package:flutter/material.dart';

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
    return Card(
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
                      left: -15,
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
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LessonName(lessonName),
                          LessonTeacher(teacherFullName),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LessonRoom(roomNo),
                          LessonCorpus(corpusNo)
                        ],
                      ),
                    )
                  ],
                ),
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
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: const Icon(Icons.door_sliding),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(15),
                borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.all(8),
            child: Text(lessonRoom.toString()),
          )
        ],
      ),
    );
  }
}

class LessonCorpus extends StatelessWidget {
  const LessonCorpus(this.lessonCorpus, {super.key});

  final int lessonCorpus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: const Icon(Icons.apartment),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withAlpha(15),
              borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.all(8),
          child: Text(lessonCorpus.toString()),
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
    return Flexible(child: Container(
      margin: EdgeInsets.only(top: 8),
      child: Text(
        'Müəllim: $teacherFullName',
        style: const TextStyle(
            fontSize: 14
        ),
      ),
    ));
  }
}

class LessonName extends StatelessWidget {
  const LessonName(this.lessonName, {super.key});

  final String lessonName;

  @override
  Widget build(BuildContext context) {
    return Text(
      lessonName,
      style: const TextStyle(
        fontSize: 22,
      ),
    );
  }
}