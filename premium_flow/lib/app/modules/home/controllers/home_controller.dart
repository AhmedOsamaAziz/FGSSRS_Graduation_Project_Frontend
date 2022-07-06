import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/controllers.dart';
import 'package:premium_flow/app/routes/app_pages.dart';

class HomeController extends GetxController {
  // static HomeController instance = Get.find();
  var selectedIndex = 0.obs;
  var currentPage = newObject<Widget>().obs;
  var title = "Students".obs;

  @override
  void onInit() {
    super.onInit();
    // Get.put(NavigationController());
    // navigationController.navigateTo('/student');
    currentPage.value = AppPages.routes
        .where((element) => element.name == '/student')
        .first
        .page
        .call();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void changeCurrentPage(String pageName) {
    currentPage.value = AppPages.routes
        .firstWhere((element) => element.name == pageName)
        .page
        .call();
  }
}
