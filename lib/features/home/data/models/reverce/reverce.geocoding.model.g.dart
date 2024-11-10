// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverce.geocoding.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reverce _$ReverceFromJson(Map<String, dynamic> json) => Reverce(
      place: json['place'] == null
          ? null
          : Place.fromJson(json['place'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReverceToJson(Reverce instance) => <String, dynamic>{
      'place': instance.place,
      'status': instance.status,
    };
