import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area_components.geocoding.model.g.dart';

@JsonSerializable()
class AreaComponents extends Equatable {
  final String? area;
  @JsonKey(name: 'sub_area')
  final String? subArea;

  const AreaComponents({this.area, this.subArea});

  factory AreaComponents.fromJson(Map<String, dynamic> json) {
    return _$AreaComponentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AreaComponentsToJson(this);

  AreaComponents copyWith({
    String? area,
    String? subArea,
  }) {
    return AreaComponents(
      area: area ?? this.area,
      subArea: subArea ?? this.subArea,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [area, subArea];
}
