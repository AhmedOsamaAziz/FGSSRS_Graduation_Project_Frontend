import 'package:get/get.dart';

import '../controllers/postpone_course_controller.dart';

class PostponeCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostponeCourseController>(
      () => PostponeCourseController(),
    );
  }
}
