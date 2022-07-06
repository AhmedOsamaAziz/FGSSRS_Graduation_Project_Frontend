import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/data/helper/enums/open_for.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/models/application.dart';
import 'package:premium_flow/app/data/models/application_documnet.dart';
import 'package:premium_flow/app/data/network/network.dart';
import 'package:premium_flow/app/data/repository/cycle_repository.dart';
import 'package:premium_flow/app/modules/home/controllers/home_controller.dart';
import 'package:premium_flow/app/modules/postpone_course/controllers/postpone_course_controller.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_button.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_container.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';

import '../controllers/flow_controller.dart';

class FlowView extends GetView<FlowController> {
  const FlowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FlowController());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      // right: kSpacing / 2,
                      left: kSpacing / 2,
                      top: kSpacing / 2,
                      bottom: kSpacing / 2),
                  child: MyContainer(
                    radius: kSpacing,
                    height: double.infinity,
                    color: KlightPallet.secondBackgroundColor,
                    child: Obx(
                      () => controller.state.value == LoadingState.retrieved
                          ? _buildSide() //_buildSide()
                          : Center(child: Text("Not Found")),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      _buildActions(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(kSpacing / 2),
                          child: MyContainer(
                            radius: 50,
                            color: KlightPallet.secondBackgroundColor,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0, top: 20),
                                  child: MyText(
                                    color: Colors
                                        .black87, //KlightPallet.primaryColor,
                                    text: "All Avavilable Applications",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,

                                    // textAlign: TextAlign.start,
                                  ),
                                ),
                                Obx(
                                  () => Expanded(
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: DataTable(
                                          showBottomBorder: true,
                                          // dataRowColor:
                                          //     MaterialStateProperty.all(Colors.black),
                                          border: const TableBorder(
                                            horizontalInside: BorderSide(
                                                color: KlightPallet
                                                    .backgroundColor),
                                          ),
                                          columns: const [
                                            DataColumn(
                                              label: MyText(
                                                color: KlightPallet
                                                    .informationColor,
                                                text: 'Application No',
                                              ),
                                            ),
                                            DataColumn(
                                              label: MyText(
                                                color: KlightPallet
                                                    .informationColor,
                                                text: 'Student',
                                              ),
                                            ),
                                            DataColumn(
                                              label: MyText(
                                                color: KlightPallet
                                                    .informationColor,
                                                text: 'Employee',
                                              ),
                                            ),
                                            DataColumn(
                                              label: MyText(
                                                color: KlightPallet
                                                    .informationColor,
                                                text: 'Stage',
                                              ),
                                            ),
                                          ],
                                          rows: controller.availableApplications
                                              .asMap()
                                              .entries
                                              .map((e) {
                                            final index = e.key;
                                            final data = e.value;
                                            return DataRow(
                                                onSelectChanged: (value) {
                                                  controller.toBePickedApp
                                                      .value = data;
                                                  // controller.selectedRowIndex
                                                  //     .value = index;
                                                },
                                                selected: controller
                                                        .toBePickedApp.value ==
                                                    data,
                                                cells: [
                                                  DataCell(MyText(
                                                    text: data.applicationNumber
                                                        .toString(),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                                  DataCell(MyText(
                                                    text: data.studentName
                                                        .toString(),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                                  DataCell(MyText(
                                                    text: data.employeeName
                                                        .toString(),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                                  DataCell(MyText(
                                                    text: data.currentStage
                                                        .toString(),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                                ]);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(kSpacing / 2),
                          child: MyContainer(
                            radius: 50,
                            color: KlightPallet.secondBackgroundColor,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0, top: 20),
                                  child: MyText(
                                    color: Colors
                                        .black87, //KlightPallet.primaryColor,
                                    text: "Picked Up Applications",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,

                                    // textAlign: TextAlign.start,
                                  ),
                                ),
                                Obx(
                                  () => Expanded(
                                    child: SingleChildScrollView(
                                      // scrollDirection: Axis.vertical,
                                      primary: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(kSpacing),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: DataTable(
                                            showBottomBorder: true,
                                            // dataRowColor:
                                            //     MaterialStateProperty.all(Colors.black),
                                            border: const TableBorder(
                                              horizontalInside: BorderSide(
                                                  color: KlightPallet
                                                      .backgroundColor),
                                            ),
                                            columns: const [
                                              DataColumn(
                                                label: MyText(
                                                  color: KlightPallet
                                                      .informationColor,
                                                  text: 'Application No',
                                                ),
                                              ),
                                              DataColumn(
                                                label: MyText(
                                                  color: KlightPallet
                                                      .informationColor,
                                                  text: 'Student',
                                                ),
                                              ),
                                              DataColumn(
                                                label: MyText(
                                                  color: KlightPallet
                                                      .informationColor,
                                                  text: 'Employee',
                                                ),
                                              ),
                                              DataColumn(
                                                label: MyText(
                                                  color: KlightPallet
                                                      .informationColor,
                                                  text: 'Stage',
                                                ),
                                              ),
                                              DataColumn(
                                                label: MyText(
                                                  color: KlightPallet
                                                      .informationColor,
                                                  text: 'View',
                                                ),
                                              ),
                                            ],
                                            rows: controller.pickedApplications
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              final data = e.value;
                                              return DataRow(cells: [
                                                DataCell(MyText(
                                                  text: data.applicationNumber
                                                      .toString(),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                                DataCell(MyText(
                                                  text: data.studentName
                                                      .toString(),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                                DataCell(MyText(
                                                  text: data.employeeName
                                                      .toString(),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                                DataCell(
                                                  MyText(
                                                    text: data.currentStage
                                                        .toString(),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                DataCell(
                                                  MyButton(
                                                    onPressed: () {
                                                      // ApplicationDocumnet x =
                                                      //     ApplicationDocumnet(
                                                      //   applicationNumber:
                                                      //       int.parse(data
                                                      //           .applicationNumber!),
                                                      //   currentCycleStageLinkId:
                                                      //       data.currentCycleStageLinkId,
                                                      //   studentId:
                                                      //       data.studentId,
                                                      // );

                                                      Get.put(
                                                          PostponeCourseController());
                                                      PostponeCourseController
                                                          pctr = Get.find();
                                                      pctr.applicationNo.text =
                                                          data.applicationNumber
                                                              .toString();
                                                      pctr.courseName.text =
                                                          data.studentName
                                                              .toString();
                                                      ;
                                                      pctr.openFor.value =
                                                          OpenFor.edit;
                                                      HomeController ctr =
                                                          Get.find();
                                                      ctr.changeCurrentPage(
                                                          '/postpone-course');
                                                      ctr.title.value =
                                                          "Course Potpone";
                                                    },
                                                    child: MyText(
                                                      color: Colors.white,
                                                      text: "Open",
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]);
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
      backgroundColor: KlightPallet.backgroundColor,
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.only(right: kSpacing / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyButton(
            width: 100,
            onPressed: () {
              controller.pickupApplication();
            },
            child: const MyText(color: Colors.white, text: "Pick Up"),
          )
        ],
      ),
    );
  }

  Widget _buildSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: controller.cyclesStages.asMap().entries.map((e) {
        // final index = e.key;
        final cycle = e.value;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(left: kSpacing / 2, top: kSpacing),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_tree,
                    color: Colors.black,
                    // size: 20,
                  ),
                  const SizedBox(
                    width: kSpacing / 3,
                  ),
                  Expanded(
                    child: MyText(
                      text: cycle.cycleName!,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cycle.stages!.asMap().entries.map((e) {
                // final index = e.key;
                final stage = e.value;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyContainer(
                    isSelected:
                        controller.selectedStageIndex.value == stage.id!,
                    hoverColor: KlightPallet.secondColor,
                    onTap: () {
                      controller.selectedStageIndex.value = stage.id!;
                    },
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyText(
                        text: stage.stageId!.stageName!,
                        color: controller.selectedStageIndex.value == stage.id!
                            ? Colors.white
                            : Colors.black87,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ]);
      }).toList(),
    );

    //  Column(children: controller.cyclesStages.value.asMap().entries.map((e) => {
    //     final data = e.Value;
    //     return Column(children: )
    //   }).toList();
    //   );
  }
}
