import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class HistoryModel{
  String? id;
  String? fullName;
  String? dateCreated;
  int? total;

  HistoryModel({this.id, this.fullName, this.dateCreated, this.total});
  
  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}