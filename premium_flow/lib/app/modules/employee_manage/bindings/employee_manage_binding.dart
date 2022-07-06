import 'package:get/get.dart';

import '../controllers/employee_manage_controller.dart';

class EmployeeManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeManageController>(
      () => EmployeeManageController(),
    );
  }
}
