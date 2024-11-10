part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

@Freezed(copyWith: true, equal: true)
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Reverce()) Reverce reverceModelDataResponce,
    @Default("") String selectedValue,
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(false) bool locationServiceEnabled,
    @Default(false) bool permissionGranted,
    maplibre.MapLibreMapController? mapController,
  }) = _HomeState;
}
