// To parse this JSON data, do
//
//     final cycleStageRoute = cycleStageRouteFromJson(jsonString);

import 'dart:convert';

List<CycleStageRoute> cycleStageRouteFromJson(String str) =>
    List<CycleStageRoute>.from(
        json.decode(str).map((x) => CycleStageRoute.fromJson(x)));

String cycleStageRouteToJson(List<CycleStageRoute> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CycleStageRoute {
  CycleStageRoute({
    this.id,
    this.cycleStageLinkId,
    this.nextCycleStageLinkId,
  });

  int? id;
  CycleStageLinkId? cycleStageLinkId;
  CycleStageLinkId? nextCycleStageLinkId;

  factory CycleStageRoute.fromJson(Map<String, dynamic> json) =>
      CycleStageRoute(
        id: json["id"],
        cycleStageLinkId:
            CycleStageLinkId.fromJson(json["cycle_stage_link_id"]),
        nextCycleStageLinkId:
            CycleStageLinkId.fromJson(json["next_Cycle_stage_link_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cycle_stage_link_id": cycleStageLinkId!.toJson(),
        "next_Cycle_stage_link_id": nextCycleStageLinkId!.toJson(),
      };
}

class CycleStageLinkId {
  CycleStageLinkId({
    this.id,
    this.isInit,
    this.cycleId,
    this.stageId,
  });

  int? id;
  bool? isInit;
  CycleId? cycleId;
  StageId? stageId;

  factory CycleStageLinkId.fromJson(Map<String, dynamic> json) =>
      CycleStageLinkId(
        id: json["id"],
        isInit: json["is_init"],
        cycleId: CycleId.fromJson(json["cycle_id"]),
        stageId: StageId.fromJson(json["stage_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_init": isInit,
        "cycle_id": cycleId!.toJson(),
        "stage_id": stageId!.toJson(),
      };
}

class CycleId {
  CycleId({
    this.id,
    this.cycleName,
    this.document,
  });

  int? id;
  String? cycleName;
  String? document;

  factory CycleId.fromJson(Map<String, dynamic> json) => CycleId(
        id: json["id"],
        cycleName: json["cycle_name"],
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cycle_name": cycleName,
        "document": document,
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
