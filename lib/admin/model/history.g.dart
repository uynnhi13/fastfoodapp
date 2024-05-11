// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      dateCreated: json['dateCreated'] as String?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'dateCreated': instance.dateCreated,
      'total': instance.total,
    };
