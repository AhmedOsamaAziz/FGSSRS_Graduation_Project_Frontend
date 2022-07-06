import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/employee.dart';
import 'package:premium_flow/app/data/repository/employee_repository.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  var state = LoadingState.init.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllEmployees();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future getAllEmployees() async {
    state.value = LoadingState.loading;
    GenericResponse response = await EmployeeRepository().getAllEmployees();

    if (response.status == ResponseStatus.success) {
      employees(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      employees();
      state.value = LoadingState.notFound;
    }
  }
}
