import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/data/network/network.dart';

class StudentRepository {
  Future<GenericResponse> getAllStudents() async {
    try {
      GenericResponse response =
          await NetWork().get('http://127.0.0.1:8000/', 'student/student_list');
      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);
        List<Student> user = studentFromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: user);
      }
      // print(response.message);
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }

  Future<GenericResponse> addNewStudent(Student student) async {
    try {
      var dd = student.toJson();
      GenericResponse response = await NetWork().post(
          'http://127.0.0.1:8000/', 'student/student_list', student.toJson());
      if (response.status == ResponseStatus.success) {
        // Student student = studentToJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: student);
      }
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
