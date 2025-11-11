import 'package:flutter/material.dart';

import '../model/exam.dart';

class ExamCard extends StatelessWidget {
  ExamCard({super.key, required this.exam});

  final Exam exam;

  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    final date = exam.dateTime;
    final formattedDate =
        "${date.day} ${monthNames[date.month - 1]} ${date.year}";
    final formattedTime =
        "${date.hour}:${date.minute.toString().padLeft(2, '0')}h";

    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/detail_screen", arguments: exam);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 8,
          color: exam.dateTime.isBefore(DateTime.now())
              ? Colors.grey[300]
              : Colors.green[100],

          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.blue,),
                    SizedBox(width: 6),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                          color: Colors.blueGrey
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, size: 18),
                    SizedBox(width: 6),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(exam.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.room, color: Colors.green,),
                    SizedBox(width: 6),
                    Text(
                      exam.classrooms.join(", "),
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
