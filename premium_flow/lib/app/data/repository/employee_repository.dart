import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';
import 'package:premium_flow/app/data/models/employee.dart';
import 'package:premium_flow/app/data/network/network.dart';

class EmployeeRepository {
  Future<GenericResponse> getAllEmployees() async {
    try {
      GenericResponse response = await NetWork()
          .get('http://127.0.0.1:8000/', 'employee/employees_list');
      if (response.status == ResponseStatus.success) {
        // print(response.obj.body);
        List<Employee> employee = employeeFromJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: employee);
      }
      // print(response.message);
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }

  Future<GenericResponse> addNewEmployee(Employee employee) async {
    try {
      var dd = employee.toJson();
      GenericResponse response = await NetWork().post('http://127.0.0.1:8000/',
          'employee/employees_list', employee.toJson());
      if (response.status == ResponseStatus.success) {
        // Student student = studentToJson(response.obj.body);
        return GenericResponse(status: ResponseStatus.success, obj: employee);
      }
      return GenericResponse(status: ResponseStatus.fail);
    } on Exception catch (e) {
      return GenericResponse(
          status: ResponseStatus.fail, message: e.toString());
    }
  }
}
