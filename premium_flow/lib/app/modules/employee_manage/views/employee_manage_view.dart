import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/modules/home/controllers/home_controller.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_dropdown.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text_form_field.dart';

import '../controllers/employee_manage_controller.dart';

class EmployeeManageView extends GetView<EmployeeManageController> {
  const EmployeeManageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeManageController());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            _buildTopRow(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kSpacing),
                child: MyContainer(
                  height: 600,
                  width: double.infinity,
                  highlightColor: KlightPallet.secondBackgroundColor,
                  color: KlightPallet.secondBackgroundColor,
                  hoverColor: KlightPallet.secondBackgroundColor,
                  child: _buildBody(),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: KlightPallet.backgroundColor,
    );
  }

  Widget _buildTopRow() {
    HomeController ctr = Get.find();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: kSpacing),
            child: MyContainer(
              // color: KlightPallet.secondBackgroundColor,
              child: Row(
                children: [
                  MyButton(
                    // overlayColor: KlightPallet.informationColor,
                    width: 100,
                    color: KlightPallet.secondBackgroundColor,
                    onPressed: () {
                      ctr.changeCurrentPage('/employee');
                      ctr.title.value = 'Employee';
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          color: KlightPallet.informationColor,
                        ),
                        MyText(
                          color: KlightPallet.informationColor,
                          text: "Back",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: kSpacing),
          child: MyButton(
            color: KlightPallet.primaryColor,
            onPressed: () async {
              await controller.addNewEmployee();
              Get.snackbar(
                "Done",
                "Employee has been adde successfully",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              ctr.changeCurrentPage('/employee');
              ctr.title.value = 'Employee';
            },
            child: const MyText(
              text: "Save",
              color: KlightPallet.primaryColorFont,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Center(
      child: SizedBox(
        width: 400,
        child: Form(
          key: controller.formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextFormField(
                  labelText: "Name",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.employee.value.empName = value;
                  },
                  onSuffixPressed: () {},
                  validator: controller.validateName),
              MyTextFormField(
                  labelText: "Email",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.employee.value.email = value;
                  },
                  onSuffixPressed: () {},
                  validator: controller.validateName),
              MyTextFormField(
                  labelText: "Mobile",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.employee.value.mobile = value!;
                  },
                  onSuffixPressed: () {},
                  validator: controller.validateMobile),
              MyTextFormField(
                  labelText: "National ID",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.employee.value.nationalId = value;
                  },
                  onSuffixPressed: () {},
                  validator: controller.validateIdentity),
            ],
          ),
        ),
      ),
    );
  }
}
