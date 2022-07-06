import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/application_documnet.dart';
import 'package:premium_flow/app/data/network/network.dart';

class ApplicationDocumentRepository {
  Future requestApplicationDocumnet(
      ApplicationDocumnet applicationDocumnet) async {
    try {
      GenericResponse response = await NetWork().post('http://127.0.0.1:8000/',
          'application/add_application_documnet', applicationDocumnet.toJson());

      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);
        // ApplicationDocumnet applications =
        //     ApplicationDocumnet.fromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success);
      }
      return GenericResponse(
          status: ResponseStatus.fail, message: response.message);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
