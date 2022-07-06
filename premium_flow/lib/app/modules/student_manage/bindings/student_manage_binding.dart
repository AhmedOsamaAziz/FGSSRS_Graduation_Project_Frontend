import 'package:get/get.dart';

import '../controllers/student_manage_controller.dart';

class StudentManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentManageController>(
      () => StudentManageController(),
    );
  }
}
