import 'package:get/get.dart';

import '../controllers/flow_controller.dart';

class FlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlowController>(
      () => FlowController(),
    );
  }
}
