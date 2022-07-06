import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/open_for.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/application_documnet.dart';
import 'package:premium_flow/app/data/models/cycle_stage_route.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/data/repository/application_document_repository.dart';
import 'package:premium_flow/app/data/repository/cycle_satge_route-repository.dart';
import 'package:premium_flow/app/data/repository/student_repository.dart';

class PostponeCourseController extends GetxController {
  late GlobalKey<FormState> formKey;

  final applicationNo = TextEditingController();
  final courseName = TextEditingController();
  final reason = TextEditingController();

  var applicationDocumnet = ApplicationDocumnet().obs;
  var state = LoadingState.init.obs;
  var openFor = OpenFor.add.obs;

  var studentList = <Student>[].obs;
  var selectedStudent = Student().obs;

  var cycleStageRoutes = <CycleStageRoute>[].obs;
  var selectedRoute = CycleStageRoute().obs;

  @override
  void onInit() async {
    super.onInit();

    formKey = GlobalKey<FormState>();
    await fillStudents();

    selectedStudent(studentList[0]);

    await fillRoutes(applicationDocumnet.value.currentCycleStageLinkId ?? 1);
    selectedRoute(cycleStageRoutes[0]);

    courseName.text = "dsds";

    // if (openFor.value == OpenFor.edit) {
    //   applicationNo.text = 12143 as String;
    //   courseName.text = applicationDocumnet.value.subjectName.toString();
    //   print(applicationDocumnet.value.subjectName.toString());
    // }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  Future insertApplicationDocument() async {
    try {
      state.value = LoadingState.loading;

      formKey.currentState!.save();

      applicationDocumnet.value.studentId = selectedStudent.value.id;
      applicationDocumnet.value.currentCycleStageLinkId = 1;
      print('henaa');
      GenericResponse response = await ApplicationDocumentRepository()
          .requestApplicationDocumnet(applicationDocumnet.value);

      if (response.status == ResponseStatus.success) {
        state.value = LoadingState.added;
      } else {
        state.value = LoadingState.notFound;
        print(response.message);
      }
    } on Exception catch (e) {
      state.value = LoadingState.notFound;
      print(e.toString());
    }
  }

  Future fillStudents() async {
    state.value = LoadingState.loading;

    GenericResponse response = await StudentRepository().getAllStudents();
    if (response.status == ResponseStatus.success) {
      studentList(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      state.value = LoadingState.notFound;
    }
  }

  Future fillRoutes(int cycle_stage_id) async {
    state.value = LoadingState.loading;

    GenericResponse response =
        await CycleStageRouteRepository().getNextRouteOf(cycle_stage_id);
    if (response.status == ResponseStatus.success) {
      cycleStageRoutes(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      state.value = LoadingState.notFound;
    }
  }
}
