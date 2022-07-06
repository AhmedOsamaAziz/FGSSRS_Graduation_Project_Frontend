import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/employee.dart';
import 'package:premium_flow/app/data/repository/employee_repository.dart';
import 'package:premium_flow/app/modules/employee/controllers/employee_controller.dart';

class EmployeeManageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // OBS
  var employee = Employee().obs;

  var state = LoadingState.init.obs;

  Future addNewEmployee() async {
    state.value = LoadingState.loading;
    var isValid = formKey.currentState!.validate();

    if (!isValid) {
      state.value = LoadingState.notFound;
      return;
    }

    formKey.currentState!.save();

    GenericResponse response =
        await EmployeeRepository().addNewEmployee(employee.value);
    if (response.status == ResponseStatus.success) {
      state.value = LoadingState.added;

      EmployeeController ctr = Get.find();
      ctr.employees.add(employee.value);
      formKey.currentState!.reset();
      employee();
      // clearControllers();
    } else {
      state.value = LoadingState.notFound;
    }
  }

  String? validateName(String? value) {
    return value!.isEmpty ? 'Value Can Not Be Null' : null;
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value!.length != 11) {
      return 'Value should be 11 charachter';
    }
    return null;
  }

  String? validateIdentity(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length != 14) {
      return 'Value should be 14 charachter';
    }
    return null;
  }
}
