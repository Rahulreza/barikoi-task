import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_components.geocoding.model.dart';
import 'area_components.geocoding.model.dart';

part 'place.geocoding.model.g.dart';

@JsonSerializable()
class Place extends Equatable {
  final int? id;
  @JsonKey(name: 'distance_within_meters')
  final double? distanceWithinMeters;
  final String? address;
  final String? area;
  final String? city;
  final String? postCode;
  @JsonKey(name: 'address_bn')
  final String? addressBn;
  @JsonKey(name: 'area_bn')
  final String? areaBn;
  @JsonKey(name: 'city_bn')
  final String? cityBn;
  final String? country;
  final String? division;
  final String? district;
  @JsonKey(name: 'sub_district')
  final String? subDistrict;
  final dynamic pauroshova;
  final dynamic union;
  @JsonKey(name: 'location_type')
  final String? locationType;
  @JsonKey(name: 'address_components')
  final AddressComponents? addressComponents;
  @JsonKey(name: 'area_components')
  final AreaComponents? areaComponents;

  const Place({
    this.id,
    this.distanceWithinMeters,
    this.address,
    this.area,
    this.city,
    this.postCode,
    this.addressBn,
    this.areaBn,
    this.cityBn,
    this.country,
    this.division,
    this.district,
    this.subDistrict,
    this.pauroshova,
    this.union,
    this.locationType,
    this.addressComponents,
    this.areaComponents,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  Place copyWith({
    int? id,
    double? distanceWithinMeters,
    String? address,
    String? area,
    String? city,
    String? postCode,
    String? addressBn,
    String? areaBn,
    String? cityBn,
    String? country,
    String? division,
    String? district,
    String? subDistrict,
    dynamic pauroshova,
    dynamic union,
    String? locationType,
    AddressComponents? addressComponents,
    AreaComponents? areaComponents,
  }) {
    return Place(
      id: id ?? this.id,
      distanceWithinMeters: distanceWithinMeters ?? this.distanceWithinMeters,
      address: address ?? this.address,
      area: area ?? this.area,
      city: city ?? this.city,
      postCode: postCode ?? this.postCode,
      addressBn: addressBn ?? this.addressBn,
      areaBn: areaBn ?? this.areaBn,
      cityBn: cityBn ?? this.cityBn,
      country: country ?? this.country,
      division: division ?? this.division,
      district: district ?? this.district,
      subDistrict: subDistrict ?? this.subDistrict,
      pauroshova: pauroshova ?? this.pauroshova,
      union: union ?? this.union,
      locationType: locationType ?? this.locationType,
      addressComponents: addressComponents ?? this.addressComponents,
      areaComponents: areaComponents ?? this.areaComponents,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      distanceWithinMeters,
      address,
      area,
      city,
      postCode,
      addressBn,
      areaBn,
      cityBn,
      country,
      division,
      district,
      subDistrict,
      pauroshova,
      union,
      locationType,
      addressComponents,
      areaComponents,
    ];
  }
}
