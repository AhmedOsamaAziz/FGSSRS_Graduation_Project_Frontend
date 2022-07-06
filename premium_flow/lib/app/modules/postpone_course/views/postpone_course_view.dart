import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/data/helper/enums/open_for.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/models/cycle_stage_route.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_dropdown.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text_form_field.dart';

import '../controllers/postpone_course_controller.dart';

class PostponeCourseView extends GetView<PostponeCourseController> {
  const PostponeCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PostponeCourseController());
    return Scaffold(
      backgroundColor: KlightPallet.backgroundColor,
      body: Obx(
        () => controller.state.value == LoadingState.loading
            ? const Center(
                child: CircularProgressIndicator(
                color: KlightPallet.primaryColor,
              ))
            : SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    _buildTopRow(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(kSpacing / 2),
                        child: MyContainer(
                            radius: kSpacing,
                            width: double.infinity,
                            height: double.infinity,
                            color: KlightPallet.secondBackgroundColor,
                            child: _buildForm()),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTopRow() {
    return Padding(
      padding: const EdgeInsets.only(right: kSpacing / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyButton(
            onPressed: () async {
              await controller.insertApplicationDocument();
              if (controller.state.value == LoadingState.added) {
                Get.snackbar(
                    'Done', 'Application has been submitted successfully',
                    backgroundColor: Colors.green, colorText: Colors.white);
              } else if (controller.state.value == LoadingState.notFound) {
                Get.snackbar('Error', 'Error',
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
            child: const MyText(
              color: Colors.white,
              text: "Save Application",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Center(
      child: Form(
        key: controller.formKey,
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextFormField(
                  onSaved: (value) {
                    controller.applicationDocumnet.value.applicationNumber =
                        int.parse(value!);
                  },
                  controller: controller.applicationNo,
                  labelText: 'Application No.',
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                ),
              ),
              Obx(
                () => MyDropdown<Student>(
                    fillColor: KlightPallet.backgroundColor,
                    isExpanded: true,
                    hint: const Text('Select Student'),
                    value: controller.selectedStudent.value,
                    onChanged: (value) {
                      controller.selectedStudent.value = value!;
                    },
                    items: controller.studentList.asMap().entries.map((e) {
                      final data = e.value;
                      return DropdownMenuItem<Student>(
                        value: data,
                        enabled: true,
                        child: Text(data.name.toString()),
                      );
                    }).toList()),
              ),
              Obx(
                () => MyDropdown<CycleStageRoute>(
                    fillColor: KlightPallet.backgroundColor,
                    isExpanded: true,
                    hint: controller.openFor.value == OpenFor.add
                        ? Text("init State")
                        : Text('Routes'),
                    value: controller.openFor.value == OpenFor.add
                        ? null
                        : controller.selectedRoute.value,
                    onChanged: (value) {
                      controller.selectedRoute.value = value!;
                    },
                    items: controller.openFor.value == OpenFor.add
                        ? null
                        : controller.cycleStageRoutes.asMap().entries.map((e) {
                            final data = e.value;
                            return DropdownMenuItem<CycleStageRoute>(
                              value: data,
                              enabled: true,
                              child: Text(data
                                  .nextCycleStageLinkId!.stageId!.stageName!),
                            );
                          }).toList()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextFormField(
                  onSaved: (value) {
                    controller.applicationDocumnet.value.subjectName = value!;
                  },
                  controller: controller.courseName,
                  labelText: 'Course Name',
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextFormField(
                  onSaved: (value) {
                    controller.applicationDocumnet.value.postponeReason =
                        value!;
                  },
                  controller: controller.reason,
                  labelText: 'Reason',
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
