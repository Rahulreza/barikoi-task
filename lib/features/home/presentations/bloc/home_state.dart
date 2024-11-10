part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

@Freezed(copyWith: true, equal: true)
class HomeState with _$HomeState {
  const factory HomeState({
    @Default("")  String selectedValue,
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(false) bool locationServiceEnabled,
    @Default(false) bool permissionGranted,
    maplibre.MaplibreMapController? mapController,
}) = _HomeState;
}
