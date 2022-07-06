// To parse this JSON data, do
//
//     final applicationDocumnet = applicationDocumnetFromJson(jsonString);

import 'dart:convert';

List<ApplicationDocumnet> applicationDocumnetFromJson(String str) =>
    List<ApplicationDocumnet>.from(
        json.decode(str).map((x) => ApplicationDocumnet.fromJson(x)));

String applicationDocumnetToJson(List<ApplicationDocumnet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationDocumnet {
  ApplicationDocumnet({
    this.applicationNumber,
    this.currentCycleStageLinkId,
    this.studentId,
    this.subjectName,
    this.postponeReason,
  });

  int? applicationNumber;
  int? currentCycleStageLinkId;
  int? studentId;
  String? subjectName;
  String? postponeReason;

  factory ApplicationDocumnet.fromJson(Map<String, dynamic> json) =>
      ApplicationDocumnet(
        applicationNumber: json["application_number"],
        currentCycleStageLinkId: json["current_cycle_stage_link_id"],
        studentId: json["student_id"],
        subjectName: json["subject_name"],
        postponeReason: json["postpone_reason"],
      );

  Map<String, dynamic> toJson() => {
        "application_number": applicationNumber,
        "current_cycle_stage_link_id": currentCycleStageLinkId,
        "student_id": studentId,
        "subject_name": subjectName,
        "postpone_reason": postponeReason,
      };
}
