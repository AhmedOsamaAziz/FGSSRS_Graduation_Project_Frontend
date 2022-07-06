import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/application.dart';
import 'package:premium_flow/app/data/network/network.dart';

class ApplicationRepository {
  Future<GenericResponse> getApplications() async {
    try {
      GenericResponse response = await NetWork()
          .get('http://127.0.0.1:8000/', 'application/applications_list');
      // empid == null
      //     ? 'application/applications_list'
      //     : 'application/applications_list?current_employee_id=$empid');

      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);
        List<Application> applications = applicationFromJson(response.obj.body);
        return GenericResponse(
            status: ResponseStatus.success, obj: applications);
      }
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }

  Future<GenericResponse> getPickedApplications(int employeeId) async {
    try {
      GenericResponse response = await NetWork().get('http://127.0.0.1:8000/',
          'application/picked_applications_list?current_employee_id=$employeeId');
      // empid == null
      //     ? 'application/applications_list'
      //     : 'application/applications_list?current_employee_id=$empid');

      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);
        List<Application> applications = applicationFromJson(response.obj.body);
        return GenericResponse(
            status: ResponseStatus.success, obj: applications);
      }
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }

  Future<GenericResponse> pickupApplication(Application application) async {
    try {
      GenericResponse response = await NetWork().put('http://127.0.0.1:8000/',
          'application/pickup/${application.id}', application.toJson());
      if (response.status == ResponseStatus.success) {
        // Application applications = Application.fromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success);
      }
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
