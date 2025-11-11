import 'package:flutter/material.dart';
import '../model/exam.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final List<String> monthNames = [
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
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;
    final date = exam.dateTime;
    final formattedDate =
        "${date.day} ${monthNames[date.month - 1]} ${date.year}";
    final formattedTime =
        "${date.hour}:${date.minute.toString().padLeft(2, '0')}h";

    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays > 0 ? difference.inDays : 0;
    final hours = difference.inHours % 24 > 0 ? difference.inHours % 24 : 0;
    final isPast = difference.isNegative;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          exam.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          maxLines: 2,
        ),
        backgroundColor: Colors.green[400],
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isPast ? Colors.grey[300] : Colors.green[200],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: isPast ? Colors.grey : Colors.orange,
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      isPast
                          ? "Испитот е поминат"
                          : "Преостанато време: $days дена, $hours часа",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isPast ? Colors.black54 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.green[700], size: 24),
                SizedBox(width: 8),
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 24),
                Icon(Icons.access_time, color: Colors.green[700], size: 24),
                SizedBox(width: 8),
                Text(
                  formattedTime,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 32),

            Text(
              "Простории во кои што ќе се одржи испитот:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 12),

            Wrap(
              spacing: 20,
              runSpacing: 12,
              children: [
                ...exam.classrooms.map((room) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green[600]!),
                    ),
                    child: Text(
                      room,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green[800],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
