import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';  

Future<Map<String, dynamic>?> fetchData(String inputMaster, String inputStudent) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://127.0.0.1:5000/process-circles'),
  );

  request.files.add(await http.MultipartFile.fromPath('master_sheet', inputMaster));
  request.files.add(await http.MultipartFile.fromPath('student_answer', inputStudent));

  try {
    var streamedResponse = await request.send();
    if (streamedResponse.statusCode == 200) {

      var response = await http.Response.fromStream(streamedResponse);
      var data = json.decode(response.body);
      
      print('Score: ${data['score']}');
      print('Total Questions: ${data['total_questions']}');
      print('Mistakes: ${data['mistakes']}');
      log('Base64 Image (first 100 chars): ${data['student_answer_key'].substring(0, 100)}...');

      return data;
    } else {
      throw Exception('Failed to upload files');
    }
  } catch (e) {
    print('Error during fetchData: $e');
    return null;  
  }
}

void main() async {
  String inputMaster = 'C:/Users/vian8/Desktop/Tugas2/snapgrade_app/SNAPGrade/inputs/circle_2/master1_crop.jpg';
  String inputStudent = 'C:/Users/vian8/Desktop/Tugas2/snapgrade_app/SNAPGrade/inputs/circle_2/student1_crop.jpg';

  var result = await fetchData(inputMaster, inputStudent);

  if (result != null) {
    print('API call succeeded: $result');
  } else {
    print('API call failed.');
  }
}