import 'package:flutter/material.dart';
import 'package:snap_grade_grader/views/buat_kunci.dart';
import 'package:snap_grade_grader/views/periksa_jawaban.dart';
import 'package:snap_grade_grader/views/periksa_jawaban_cross.dart';
import 'package:snap_grade_grader/views/widgets/circlebutton.dart';
import 'package:snap_grade_grader/views/widgets/topbar.dart';
import 'dart:typed_data';

class NewquizPage extends StatefulWidget {
  const NewquizPage({super.key});

  @override
  State<NewquizPage> createState() => _NeqQuizPageState();
}

class _NeqQuizPageState extends State<NewquizPage> {
  Uint8List? masterImage;

  Future<void> navigateToMasterPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BuatkunciPage(),
      ),
    );
    if (result != null) {
      setState(() {
        masterImage = result;
      });
    }
  }

  void navigateToStudentPage() {
    if (masterImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tolong Unggah Kunci Jawaban'),
        ),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pilih tipe jawaban',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PeriksajawabanPage(masterImage: masterImage!),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF424D72),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'jawaban bulat (O)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PeriksajawabanCrossPage(
                                masterImage: masterImage!),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF424D72),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'jawaban cross (x)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            Container(
              height: 800,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(40, 28, 40, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Kuis',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEDEEEF),
                      hintText: 'Nama Kuis',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Kelas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEDEEEF),
                      hintText: 'Kelas',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jumlah Pertanyaan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEDEEEF),
                      hintText: 'Jumlah Pertanyaan',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleButton(
                        title: 'Buat Kunci',
                        icon: Image.asset(
                          'assets/key.png',
                          width: double.infinity,
                        ),
                        onPressed: navigateToMasterPage,
                      ),
                      CircleButton(
                        title: 'Periksa Jawaban',
                        icon: Image.asset(
                          'assets/scan.png',
                          width: double.infinity,
                        ),
                        onPressed: masterImage != null
                            ? navigateToStudentPage
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Tolong Buat Kunci Jawaban Sebelum Periksa Jawaban'),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
