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
   // maplibre.MapLibreMapController mapController,
    @Default(maplibre.LatLng( 23.823862245054432, 90.36452020536662)) maplibre.LatLng currentLocation,
    @Default(maplibre.LatLng( 23.823862245054432, 90.36452020536662)) maplibre.LatLng dataLocation,
  }) = _HomeState;
}
