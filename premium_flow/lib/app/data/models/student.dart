// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    this.id,
    this.name,
    this.termNo,
    this.studentCode,
    this.overallRating,
    this.studyTypeId,
    this.studyType,
    this.studySpecializeId,
    this.studySpecialize,
    this.email,
    this.mobile,
    this.nationalId,
  });

  int? id;
  String? name;
  int? termNo;
  int? studentCode;
  String? overallRating;
  int? studyTypeId;
  String? studyType;
  int? studySpecializeId;
  String? studySpecialize;
  String? email;
  String? mobile;
  String? nationalId;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        termNo: json["term_no"],
        studentCode: json["student_code"],
        overallRating: json["overall_rating"],
        studyTypeId: json["study_type_id"],
        studyType: json["study_type"],
        studySpecializeId: json["study_specialize_id"],
        studySpecialize: json["study_specialize"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        nationalId: json["national_id"] == null ? null : json["national_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "term_no": termNo,
        "student_code": studentCode,
        "overall_rating": overallRating,
        "study_type_id": studyTypeId,
        "study_type": studyType,
        "study_specialize_id": studySpecializeId,
        "study_specialize": studySpecialize,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "national_id": nationalId == null ? null : nationalId,
      };
}
