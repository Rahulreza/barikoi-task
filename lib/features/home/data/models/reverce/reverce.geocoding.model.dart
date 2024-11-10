import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'place.geocoding.model.dart';

part 'reverce.geocoding.model.g.dart';

@JsonSerializable()
class Reverce extends Equatable {
  final Place? place;
  final int? status;

  const Reverce({this.place, this.status});

  factory Reverce.fromJson(Map<String, dynamic> json) {
    return _$ReverceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReverceToJson(this);

  Reverce copyWith({
    Place? place,
    int? status,
  }) {
    return Reverce(
      place: place ?? this.place,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [place, status];
}
