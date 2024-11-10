import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_components.geocoding.model.g.dart';

@JsonSerializable()
class AddressComponents extends Equatable {
  @JsonKey(name: 'place_name')
  final dynamic placeName;
  final String? house;
  final String? road;

  const AddressComponents({this.placeName, this.house, this.road});

  factory AddressComponents.fromJson(Map<String, dynamic> json) {
    return _$AddressComponentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressComponentsToJson(this);

  AddressComponents copyWith({
    dynamic placeName,
    String? house,
    String? road,
  }) {
    return AddressComponents(
      placeName: placeName ?? this.placeName,
      house: house ?? this.house,
      road: road ?? this.road,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [placeName, house, road];
}
