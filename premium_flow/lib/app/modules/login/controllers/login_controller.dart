import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/network/network.dart';

class LoginController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  // var user = User().obs;
  var isValid = false.obs;
  var state = LoadingState.init.obs;
  var isVisiblePassword = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future validateLogin() async {
    state.value = LoadingState.loading;
    GenericResponse response = await NetWork().get('http://127.0.0.1:8000/',
        'application/login?user_name=${userName.text}&password=${password.text}');
    if (response.status == ResponseStatus.success) {
      // user(User(urUsername: "Ahmed Osama"));
      isValid.value = true;
      state.value = LoadingState.retrieved;
    } else {
      isValid.value = false;
      state.value = LoadingState.notFound;
    }
  }
}
