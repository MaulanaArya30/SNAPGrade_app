import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_grade_grader/views/widgets/circlebutton.dart';
import 'package:snap_grade_grader/views/widgets/topbar.dart';

class BuatkunciPage extends StatefulWidget {
  const BuatkunciPage({super.key});

  @override
  State<BuatkunciPage> createState() => _BuatkunciPageState();
}

class _BuatkunciPageState extends State<BuatkunciPage> {
  Uint8List? masterImage;

  Future<void> pickMasterImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        Uint8List imageBytes = await file.readAsBytes();

        print('File picked: ${result.files.single.name}');
        setState(() {
          masterImage = imageBytes;
        });
      } else {
        print('File not picked');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> pickMasterImageFromCamera() async {
    final ImagePicker picker = ImagePicker();

    XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      Uint8List imageBytes = await photo.readAsBytes();
      setState(() {
        masterImage = imageBytes;
      });
    }
  }

  Future<dynamic> kunciTerunggah(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                masterImage != null
                    ? 'Kunci terunggah'
                    : 'Kunci gagal terunggah',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
              masterImage != null
                  ? Image.asset(
                      'assets/checklist.png',
                      width: 100,
                    )
                  : Container(),
              InkWell(
                onTap: () {
                  if (masterImage != null) {
                    Navigator.pop(context);
                    Navigator.pop(context, masterImage);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 209,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF5A5F73),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 64),
            const Text(
              'Buat Kunci',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                  title: 'Unggah Kunci',
                  icon: Image.asset('assets/upload.png'),
                  onPressed: () async {
                    await pickMasterImage();
                    kunciTerunggah(context);
                  },
                ),
                CircleButton(
                  title: 'Foto Kunci',
                  icon: Image.asset(
                    'assets/cam.png',
                    width: 50,
                  ),
                  onPressed: () async {
                    await pickMasterImageFromCamera();
                    kunciTerunggah(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
