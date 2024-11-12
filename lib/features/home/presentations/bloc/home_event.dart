part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.dataLoaded() = _DataLoaded;
  const factory HomeEvent.mapInitialized() = _MapInitialized;
  const factory HomeEvent.locationServiceChecked() = _LocationServiceChecked;
  const factory HomeEvent.permissionRequested() = _PermissionRequested;
  const factory HomeEvent.currentLocationRequested() =
      _CurrentLocationRequested;
  const factory HomeEvent.addCurrentLocationMarker(
          {required maplibre.MapLibreMapController mapLibController}) =
      _AddCurrentLocationMarker;
  factory HomeEvent.addDestinationLocationMarker({
    required maplibre.MapLibreMapController mapLibController,
    required BuildContext context,
  }) = _AddDestinationLocationMarker;
  const factory HomeEvent.drawPolylineToDataLocation(
          {required maplibre.MapLibreMapController mapLibController}) =
      _DrawPolylineToDataLocation;
  const factory HomeEvent.showLocationDialog({required BuildContext context}) = _ShowLocationDialog;
}
