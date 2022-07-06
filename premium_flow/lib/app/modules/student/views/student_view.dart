library student;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/modules/home/controllers/home_controller.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/shared_wedgits/notification_count.dart';

import '../controllers/student_controller.dart';

part 'student_card.dart';
part 'student_card_items.dart';

class StudentView extends GetView<StudentController> {
  const StudentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());
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
                  await controller.getAllStudents();
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
                  ctr.changeCurrentPage('/student-manage');
                  ctr.title.value = 'Student Manage';
                },
                child: const MyText(
                  text: "Add New Student",
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
              child: StudentCardItems(
                students: controller.students,
                onPressed: () {
                  print('hello');
                },
              ),
            ),
    );
  }
}
