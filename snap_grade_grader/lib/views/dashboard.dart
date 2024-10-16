import 'package:flutter/material.dart';
import 'package:snap_grade_grader/views/new_quiz.dart';
import 'package:snap_grade_grader/views/widgets/dashboardwidget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(40, 14, 40, 20),
        child: Column(
          children: [
            Image.asset('assets/logonotext.png'),
            const SizedBox(height: 38),
            const DashboardWidget(
              title: 'Ulanngan Harian 1',
              kelas: '1C',
            ),
            const DashboardWidget(
              title: 'Kuis 1',
              kelas: '3B',
            ),
            const DashboardWidget(
              title: 'Ujian Tengah Semester',
              kelas: '2A',
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 128, right: 20),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewquizPage(),
              ),
            );
          },
          label: const Row(
            children: [
              Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                " KUIS BARU ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          backgroundColor: const Color(0XFF424D72),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
