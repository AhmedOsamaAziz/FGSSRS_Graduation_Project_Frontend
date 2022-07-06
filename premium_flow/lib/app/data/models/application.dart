// To parse this JSON data, do
//
//     final application = applicationFromJson(jsonString);

import 'dart:convert';

List<Application> applicationFromJson(String str) => List<Application>.from(
    json.decode(str).map((x) => Application.fromJson(x)));

String applicationToJson(List<Application> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Application {
  Application({
    this.id,
    this.studentName,
    this.employeeName,
    this.currentStage,
    this.applicationNumber,
    this.studentId,
    this.currentEmployeeId,
    this.currentCycleStageLinkId,
  });

  int? id;
  String? studentName;
  String? employeeName;
  String? currentStage;
  String? applicationNumber;
  int? studentId;
  int? currentEmployeeId;
  int? currentCycleStageLinkId;

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json["id"],
        studentName: json["student_name"],
        employeeName: json["employee_name"],
        currentStage: json["current_stage"],
        applicationNumber: json["application_number"],
        studentId: json["student_id"],
        currentEmployeeId: json["current_employee_id"],
        currentCycleStageLinkId: json["current_cycle_stage_link_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_name": studentName,
        "employee_name": employeeName,
        "current_stage": currentStage,
        "application_number": applicationNumber,
        "student_id": studentId,
        "current_employee_id": currentEmployeeId,
        "current_cycle_stage_link_id": currentCycleStageLinkId,
      };
}
