import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/data/repository/student_repository.dart';

class StudentController extends GetxController {
  var students = <Student>[].obs;
  var state = LoadingState.init.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllStudents();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future getAllStudents() async {
    state.value = LoadingState.loading;
    GenericResponse response = await StudentRepository().getAllStudents();

    if (response.status == ResponseStatus.success) {
      students(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      students();
      state.value = LoadingState.notFound;
    }
  }
}
