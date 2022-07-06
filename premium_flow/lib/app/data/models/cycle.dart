// To parse this JSON data, do
//
//     final cycle = cycleFromJson(jsonString);

import 'dart:convert';

List<Cycle> cycleFromJson(String str) =>
    List<Cycle>.from(json.decode(str).map((x) => Cycle.fromJson(x)));

String cycleToJson(List<Cycle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cycle {
  Cycle({
    this.cycleName,
    this.stages,
  });

  String? cycleName;
  List<Stage>? stages;

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        cycleName: json["cycle_name"],
        stages: List<Stage>.from(json["stages"].map((x) => Stage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cycle_name": cycleName,
        "stages": List<dynamic>.from(stages!.map((x) => x.toJson())),
      };
}

class Stage {
  Stage({
    this.id,
    this.cycleId,
    this.stageId,
  });

  int? id;
  int? cycleId;
  int? stageId;

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
        id: json["id"],
        cycleId: json["cycle_id"],
        stageId: json["stage_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cycle_id": cycleId,
        "stage_id": stageId,
      };
}
