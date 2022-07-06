// To parse this JSON data, do
//
//     final cycleStages = cycleStagesFromJson(jsonString);

import 'dart:convert';

List<CycleStages> cycleStagesFromJson(String str) => List<CycleStages>.from(
    json.decode(str).map((x) => CycleStages.fromJson(x)));

String cycleStagesToJson(List<CycleStages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CycleStages {
  CycleStages({
    this.cycleName,
    this.stages,
  });

  String? cycleName;
  List<Stage>? stages;

  factory CycleStages.fromJson(Map<String, dynamic> json) => CycleStages(
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
    this.stageId,
  });

  int? id;
  StageId? stageId;

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
        id: json["id"],
        stageId: StageId.fromJson(json["stage_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stage_id": stageId!.toJson(),
      };
}

class StageId {
  StageId({
    this.id,
    this.stageName,
  });

  int? id;
  String? stageName;

  factory StageId.fromJson(Map<String, dynamic> json) => StageId(
        id: json["id"],
        stageName: json["stage_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stage_name": stageName,
      };
}
