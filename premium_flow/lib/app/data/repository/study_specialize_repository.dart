import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/study_specialize.dart';
import 'package:premium_flow/app/data/models/study_type.dart';
import 'package:premium_flow/app/data/network/network.dart';

class StudySpecializeRepository {
  Future<GenericResponse> getAllSpecializes() async {
    try {
      GenericResponse response = await NetWork()
          .get('http://127.0.0.1:8000/', 'student/studyspecialize_list');
      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);
        List<StudySpecialize> specializes =
            studySpecializeFromJson(response.obj.body);
        return GenericResponse(
            status: ResponseStatus.success, obj: specializes);
      }
      // print(response.message);
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }

  Future<GenericResponse> getAllStudyTypes() async {
    try {
      GenericResponse response = await NetWork()
          .get('http://127.0.0.1:8000/', 'student/studytype_list');
      if (response.status == ResponseStatus.success) {
        List<StudyType> studyTypes = studyTypeFromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: studyTypes);
      }
      // print(response.message);
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
