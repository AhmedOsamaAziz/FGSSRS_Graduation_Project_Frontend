library employee;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/models/employee.dart';
import 'package:premium_flow/app/modules/home/controllers/home_controller.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/student/views/student_view.dart';

import '../controllers/employee_controller.dart';

part 'employee_card.dart';
part 'employee_card_items.dart';

class EmployeeView extends GetView<EmployeeController> {
  const EmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeController());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          _buildTpRow(context),
          _buildBody()
        ],
      ),
      backgroundColor: KlightPallet.backgroundColor,
    );
  }

  Widget _buildTpRow(BuildContext context) {
    HomeController ctr = Get.find();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              MyButton(
                overlayColor: KlightPallet.secondBackgroundColor,
                color: KlightPallet.backgroundColor,
                width: 60,
                onPressed: () async {
                  await controller.getAllEmployees();
                },
                child: const Icon(
                  Icons.refresh,
                  color: KlightPallet.primaryColor,
                ),
              ),
              const SizedBox(
                width: kSpacing,
              ),
              MyButton(
                color: KlightPallet.primaryColor,
                onPressed: () {
                  ctr.changeCurrentPage('/employee-manage');
                  ctr.title.value = 'Employee Manage';
                },
                child: const MyText(
                  text: "Add New Employee",
                  color: KlightPallet.primaryColorFont,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Obx(
      () => controller.state.value == LoadingState.loading
          ? const Center(
              child: CircularProgressIndicator(
                color: KlightPallet.primaryColor,
              ),
            )
          : Expanded(
              child: EmployeeCardItems(
                onPressed: () {},
              ),
            ),
    );
  }
}
