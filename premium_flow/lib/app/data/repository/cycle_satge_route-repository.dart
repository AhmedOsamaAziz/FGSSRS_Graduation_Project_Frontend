import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/cycle_stage_route.dart';
import 'package:premium_flow/app/data/network/network.dart';

class CycleStageRouteRepository {
  Future<GenericResponse> getNextRouteOf(int cycle_stage_id) async {
    try {
      GenericResponse response = await NetWork().get('http://127.0.0.1:8000/',
          'application/get_next_route_of/$cycle_stage_id');
      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);

        List<CycleStageRoute> routes =
            cycleStageRouteFromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: routes);
      }
      // print(response.message);
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
