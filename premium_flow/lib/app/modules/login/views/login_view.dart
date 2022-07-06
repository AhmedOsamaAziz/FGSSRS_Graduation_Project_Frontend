import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_io/_file_decoder_io.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text_form_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KlightPallet.backgroundColor,
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(
                height: 60,
              ),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        MyText(
          color: KlightPallet.primaryColor,
          text: "Premium",
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          width: 5,
        ),
        MyText(
          color: KlightPallet.primaryColor,
          text: "Flow",
          fontSize: 32,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              MyTextFormField(
                radius: kSpacing,
                controller: controller.userName,
                hintText: 'User Name',
                onSaved: (value) {},
                onSuffixPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => MyTextFormField(
                  radius: kSpacing,
                  controller: controller.password,
                  hintText: 'Password',
                  onSaved: (value) {},
                  isPassword: controller.isVisiblePassword.value,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      controller.isVisiblePassword.value =
                          controller.isVisiblePassword.value == false
                              ? true
                              : false;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButton(
                    radius: kSpacing,
                    onPressed: () async {
                      await controller.validateLogin();
                      if (controller.isValid.value == true) {
                        controller.password.clear();
                        Get.toNamed('/home');
                      } else {
                        Get.snackbar(
                          "Error",
                          "Something wend wrong",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        ).snackbar;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: MyText(
                            text: "Login",
                            color: KlightPallet.primaryColorFont,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
