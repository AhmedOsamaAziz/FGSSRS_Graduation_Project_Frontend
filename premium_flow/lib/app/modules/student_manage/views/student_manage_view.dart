import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/models/student.dart';
import 'package:premium_flow/app/data/models/study_specialize.dart';
import 'package:premium_flow/app/data/models/study_type.dart';
import 'package:premium_flow/app/modules/home/controllers/home_controller.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_dropdown.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text_form_field.dart';

import '../controllers/student_manage_controller.dart';

class StudentManageView extends GetView<StudentManageController> {
  const StudentManageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(StudentManageController());
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
                      ctr.changeCurrentPage('/student');
                      ctr.title.value = 'Student';
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
              await controller.addNewStudent();
              if (controller.state.value == LoadingState.added) {
                Get.snackbar(
                  "Done",
                  "Student has been adde successfully",
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                ctr.changeCurrentPage('/student');
                ctr.title.value = 'Student';
              }
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
        child: SingleChildScrollView(
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
                    controller.student.value.name = value;
                    // controller.name.clear();
                  },
                  // controller: controller.name,
                  onSuffixPressed: () {},
                  validator: controller.validateName,
                  keyboardType: TextInputType.text,
                  maxLength: 120,
                ),
                MyTextFormField(
                  labelText: "Term NO",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.student.value.termNo = int.parse(value!);
                    // controller.termNo.clear();
                  },
                  // controller: controller.termNo,
                  onSuffixPressed: () {},
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  validator: (value) => value.toString().isNumericOnly
                      ? null
                      : 'Only Digits is Acceptable',
                ),
                MyTextFormField(
                  labelText: "Student Code",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.student.value.studentCode = int.parse(value!);
                    // controller.code.clear();
                  },
                  // controller: controller.code,
                  onSuffixPressed: () {},
                  validator: controller.validateCode,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
                MyTextFormField(
                  labelText: "Overall Rating",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.student.value.overallRating = value;
                    // controller.overallRating.clear();
                  },
                  // controller: controller.overallRating,
                  onSuffixPressed: () {},
                  validator: controller.validateOverAllRating,
                  keyboardType: TextInputType.number,
                ),
                Obx(
                  () => MyDropdown<StudySpecialize>(
                      fillColor: KlightPallet.backgroundColor,
                      isExpanded: true,
                      hint: Text('Select Specialize'),
                      value: controller.selectedStudySpecialize.value,
                      onChanged: (value) {
                        controller.selectedStudySpecialize.value = value!;
                        controller.student.value.studySpecializeId = value.id;
                        controller.student.value.studySpecialize =
                            value.studySpecialize;
                      },
                      items:
                          controller.studySpecializes.asMap().entries.map((e) {
                        final data = e.value;
                        return DropdownMenuItem<StudySpecialize>(
                          value: data,
                          enabled: true,
                          child: Text(data.studySpecialize.toString()),
                        );
                      }).toList()),
                ),
                Obx(
                  () => MyDropdown<StudyType>(
                      fillColor: KlightPallet.backgroundColor,
                      isExpanded: true,
                      hint: Text('Select Study Type'),
                      value: controller.selectedStudyType.value,
                      onChanged: (value) {
                        controller.selectedStudyType.value = value!;
                        controller.student.value.studyTypeId = value.id;
                        controller.student.value.studyType = value.studyType;
                      },
                      items: controller.studyTypes.asMap().entries.map((e) {
                        final data = e.value;
                        return DropdownMenuItem<StudyType>(
                          value: data,
                          enabled: true,
                          child: Text(data.studyType.toString()),
                        );
                      }).toList()),
                ),
                MyTextFormField(
                  labelText: "Email",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.student.value.email = value;
                    // controller.email.clear();
                  },
                  // controller: controller.email,
                  onSuffixPressed: () {},
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => controller.validateEmail(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: controller.validateOverAllRating,
                ),
                MyTextFormField(
                  labelText: "Mobile",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.student.value.mobile = value;
                    // controller.mobile.clear();
                  },
                  // controller: controller.mobile,
                  onSuffixPressed: () {},
                  keyboardType: TextInputType.number,
                  // validator: controller.validateOverAllRating,
                ),
                MyTextFormField(
                  labelText: "ID No.",
                  withLable: true,
                  fillColor: KlightPallet.backgroundColor,
                  onSaved: (value) {
                    controller.student.value.nationalId = value;
                    // controller.identity.clear();
                  },
                  // controller: controller.identity,
                  onSuffixPressed: () {},
                  // validator: controller.validateOverAllRating,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
