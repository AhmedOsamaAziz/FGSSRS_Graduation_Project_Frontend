import 'package:get/get.dart';
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/enums/state_enum.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/application.dart';
import 'package:premium_flow/app/data/models/cycle.dart';
import 'package:premium_flow/app/data/models/cycle_stages.dart';
import 'package:premium_flow/app/data/network/network.dart';
import 'package:premium_flow/app/data/repository/application_repository.dart';
import 'package:premium_flow/app/data/repository/cycle_repository.dart';

class FlowController extends GetxController {
  //TODO: Implement FlowController

  var state = LoadingState.init.obs;
  var cyclesStages = <CycleStages>[].obs;
  var availableApplications = <Application>[].obs;
  var pickedApplications = <Application>[].obs;
  var selectedStageIndex = 0.obs;
  // var selectedRowIndex = 0.obs;
  var toBePickedApp = Application().obs;

  @override
  void onInit() async {
    super.onInit();
    await getCycleStages();
    await getavailableApplications();
    await getPickedApplications(1);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getCycleStages() async {
    state.value = LoadingState.loading;
    GenericResponse response = await CycleRepository().getCycleInformation();

    if (response.status == ResponseStatus.success) {
      cyclesStages.value = response.obj;
      print(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      state.value = LoadingState.notFound;
    }
  }

  Future getavailableApplications() async {
    state.value = LoadingState.loading;
    GenericResponse response = await ApplicationRepository().getApplications();

    if (response.status == ResponseStatus.success) {
      availableApplications(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      availableApplications();
      state.value = LoadingState.notFound;
    }
  }

  Future getPickedApplications(int employeeId) async {
    state.value = LoadingState.loading;
    GenericResponse response =
        await ApplicationRepository().getPickedApplications(employeeId);

    if (response.status == ResponseStatus.success) {
      pickedApplications(response.obj);
      state.value = LoadingState.retrieved;
    } else {
      pickedApplications();
      state.value = LoadingState.notFound;
    }
  }

  Future pickupApplication() async {
    state.value = LoadingState.loading;
    toBePickedApp.value.currentEmployeeId = 1;
    GenericResponse response =
        await ApplicationRepository().pickupApplication(toBePickedApp.value);

    if (response.status == ResponseStatus.success) {
      toBePickedApp();
      pickedApplications.add(toBePickedApp.value);
      availableApplications.remove(toBePickedApp.value);
      state.value = LoadingState.retrieved;
    } else {
      toBePickedApp();
      state.value = LoadingState.notFound;
    }
  }
}
