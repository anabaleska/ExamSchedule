import 'package:flutter/material.dart';
import 'package:labs1/data/exam_list.dart';
import 'package:labs1/widgets/ExamCard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final sortedExams = [...examList];
    sortedExams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Рапосред за испити - 221013", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),
        backgroundColor: Colors.green[400],
        elevation: 4,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: sortedExams.map((exam) => ExamCard(exam: exam)).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Вкупно: ${examList.length}", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green[400],
        icon: Icon(Icons.event_note, color: Colors.white),
      ),
    );
  }
}
