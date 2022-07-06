import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/cycle.dart';
import 'package:premium_flow/app/data/models/cycle_stages.dart';
import 'package:premium_flow/app/data/network/network.dart';
import 'dart:convert';

class CycleRepository {
  Future<GenericResponse> getCycleInformation() async {
    try {
      GenericResponse response = await NetWork()
          .get('http://127.0.0.1:8000/', 'application/cycle_list');
      if (response.status == ResponseStatus.success) {
        List<CycleStages> cycles = cycleStagesFromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: cycles);
      }
      // print(response.message);
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
