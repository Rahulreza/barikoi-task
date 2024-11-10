// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_components.geocoding.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponents _$AddressComponentsFromJson(Map<String, dynamic> json) =>
    AddressComponents(
      placeName: json['place_name'],
      house: json['house'] as String?,
      road: json['road'] as String?,
    );

Map<String, dynamic> _$AddressComponentsToJson(AddressComponents instance) =>
    <String, dynamic>{
      'place_name': instance.placeName,
      'house': instance.house,
      'road': instance.road,
    };
