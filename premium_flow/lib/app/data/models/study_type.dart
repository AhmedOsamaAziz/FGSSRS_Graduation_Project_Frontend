// To parse this JSON data, do
//
//     final studyType = studyTypeFromJson(jsonString);

import 'dart:convert';

List<StudyType> studyTypeFromJson(String str) =>
    List<StudyType>.from(json.decode(str).map((x) => StudyType.fromJson(x)));

String studyTypeToJson(List<StudyType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudyType {
  StudyType({
    this.id,
    this.studyType,
  });

  int? id;
  String? studyType;

  factory StudyType.fromJson(Map<String, dynamic> json) => StudyType(
        id: json["id"],
        studyType: json["study_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "study_type": studyType,
      };
}
