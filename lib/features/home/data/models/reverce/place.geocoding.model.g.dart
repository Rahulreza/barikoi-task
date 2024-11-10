// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.geocoding.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      id: (json['id'] as num?)?.toInt(),
      distanceWithinMeters:
          (json['distance_within_meters'] as num?)?.toDouble(),
      address: json['address'] as String?,
      area: json['area'] as String?,
      city: json['city'] as String?,
      postCode: json['postCode'] as String?,
      addressBn: json['address_bn'] as String?,
      areaBn: json['area_bn'] as String?,
      cityBn: json['city_bn'] as String?,
      country: json['country'] as String?,
      division: json['division'] as String?,
      district: json['district'] as String?,
      subDistrict: json['sub_district'] as String?,
      pauroshova: json['pauroshova'],
      union: json['union'],
      locationType: json['location_type'] as String?,
      addressComponents: json['address_components'] == null
          ? null
          : AddressComponents.fromJson(
              json['address_components'] as Map<String, dynamic>),
      areaComponents: json['area_components'] == null
          ? null
          : AreaComponents.fromJson(
              json['area_components'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'distance_within_meters': instance.distanceWithinMeters,
      'address': instance.address,
      'area': instance.area,
      'city': instance.city,
      'postCode': instance.postCode,
      'address_bn': instance.addressBn,
      'area_bn': instance.areaBn,
      'city_bn': instance.cityBn,
      'country': instance.country,
      'division': instance.division,
      'district': instance.district,
      'sub_district': instance.subDistrict,
      'pauroshova': instance.pauroshova,
      'union': instance.union,
      'location_type': instance.locationType,
      'address_components': instance.addressComponents,
      'area_components': instance.areaComponents,
    };
