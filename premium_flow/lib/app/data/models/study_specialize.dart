// To parse this JSON data, do
//
//     final studySpecialize = studySpecializeFromJson(jsonString);

import 'dart:convert';

List<StudySpecialize> studySpecializeFromJson(String str) =>
    List<StudySpecialize>.from(
        json.decode(str).map((x) => StudySpecialize.fromJson(x)));

String studySpecializeToJson(List<StudySpecialize> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudySpecialize {
  StudySpecialize({
    this.id,
    this.studySpecialize,
  });

  int? id;
  String? studySpecialize;

  factory StudySpecialize.fromJson(Map<String, dynamic> json) =>
      StudySpecialize(
        id: json["id"],
        studySpecialize: json["study_specialize"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "study_specialize": studySpecialize,
      };
}
