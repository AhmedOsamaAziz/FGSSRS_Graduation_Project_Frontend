import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/data/models/study_specialize.dart';
import 'package:premium_flow/app/data/models/study_type.dart';
import 'package:premium_flow/app/data/repository/student_repository.dart';
import 'package:premium_flow/app/data/repository/study_specialize_repository.dart';
import 'package:premium_flow/app/modules/student/controllers/student_controller.dart';

class StudentManageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  // final name = TextEditingController();
  // final termNo = TextEditingController();
  // final code = TextEditingController();
  // final overallRating = TextEditingController();
  // final mobile = TextEditingController();
  // final email = TextEditingController();
  // final identity = TextEditingController();

  // OBS
  var student = Student(studySpecializeId: 1, studyTypeId: 1).obs;

  var studySpecializes = <StudySpecialize>[].obs;
  var selectedStudySpecialize = StudySpecialize().obs;

  var studyTypes = <StudyType>[].obs;
  var selectedStudyType = StudyType().obs;

  var state = LoadingState.init.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllDropDown();
    selectedStudySpecialize.value = studySpecializes[0];
    selectedStudyType.value = studyTypes[0];
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future getAllDropDown() async {
    state.value = LoadingState.loading;

    GenericResponse specializeResponse =
        await StudySpecializeRepository().getAllSpecializes();
    GenericResponse studyTypeResponse =
        await StudySpecializeRepository().getAllStudyTypes();

    if (specializeResponse.status == ResponseStatus.success &&
        studyTypeResponse.status == ResponseStatus.success) {
      studySpecializes(specializeResponse.obj);
      studyTypes(studyTypeResponse.obj);
      state.value = LoadingState.retrieved;
    } else {
      studySpecializes();
      studyTypes();
      state.value = LoadingState.notFound;
    }
  }

  // Future getAllStudyType() async {
  //   state.value = LoadingState.loading;

  //   if (response.status == ResponseStatus.success) {
  //     studyTypes(response.obj);
  //     state.value = LoadingState.retrieved;
  //   } else {
  //     studySpecializes();
  //     state.value = LoadingState.notFound;
  //   }
  // }

  Future addNewStudent() async {
    state.value = LoadingState.loading;
    var isValid = formKey.currentState!.validate();

    if (!isValid) {
      state.value = LoadingState.notFound;
      return;
    }

    formKey.currentState!.save();

    GenericResponse response =
        await StudentRepository().addNewStudent(student.value);
    if (response.status == ResponseStatus.success) {
      state.value = LoadingState.added;

      // overallRating.clear();
      // Not Working
      StudentController ctr = Get.find();

      ctr.students.add(student.value);
      ctr.students.refresh();
      student();
    } else {
      state.value = LoadingState.notFound;
    }
  }

  String? validateName(String? value) {
    return value!.isEmpty ? 'Value Can Not Be Null' : null;
  }

  String? validateCode(String? value) {
    if (value!.isEmpty) {
      return 'Value Can Not Be Null';
    } else if (value.toString().length > 10) {
      return 'Value can not be more than 10 digits';
    }
    return null;
  }

  String? validateOverAllRating(String? value) {
    if (value == null) {
      return null;
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
}
