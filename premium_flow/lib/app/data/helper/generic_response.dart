import 'package:premium_flow/app/data/helper/enums/response_status.dart';

class GenericResponse {
  String? message;
  var obj;
  int? code;
  ResponseStatus status;

  GenericResponse({this.message, this.obj, this.code, required this.status});
}
