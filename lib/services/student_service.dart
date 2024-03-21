import 'package:dio/dio.dart';
import 'package:schoolmanagement/model/student.dart';

class StudentService {
  final _dio = Dio();

 Future<List<Student>> getStudents() async {
    List<Student> students = [];
    try {
  final response = await _dio.get(
    "https://localhost:7130/SchoolManagement/Student/GetStudent"
  );
  if (response.statusCode == 500) {
    throw Exception();
  }
  List<dynamic> rawStudents = response.data;
  List<Student> students = rawStudents.map((student) => Student.fromJson(student)).toList();

  return students;
} catch (e) {
  try {
    final response = await _dio.get(
      "https://10.0.2.2:7130/SchoolManagement/Student/GetStudent"
    );
    if (response.statusCode == 500) {
      throw Exception();
    }
    List<dynamic> rawStudents = response.data;
    List<Student> students = rawStudents.map((student) => Student.fromJson(student)).toList();
    return students;
  } catch (e) {
    print("Both URLs failed to retrieve students.");
    // Handle the failure scenario appropriately
    return []; // or throw an error, log, etc.
  }
}
  }
}

