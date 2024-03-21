import 'package:schoolmanagement/model/student.dart';
import 'package:schoolmanagement/services/student_service.dart';
import 'package:stacked/stacked.dart';

class StudentViewModel extends BaseViewModel {
  final _studentService = StudentService();



  List<Student> _students = [];
  List<Student> get students => _students;

  StudentViewModel(){
  getStudentFromService();
  }

  getStudentFromService() async {
  _students = await _studentService.getStudents();
  rebuildUi();
  }

}
