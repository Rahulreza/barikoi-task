part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.dataLoaded() = _DataLoaded;
  const factory HomeEvent.mapInitialized() = _MapInitialized;
  const factory HomeEvent.locationServiceChecked() = _LocationServiceChecked;
  const factory HomeEvent.permissionRequested() = _PermissionRequested;
  const factory HomeEvent.currentLocationRequested() = _CurrentLocationRequested;
  const factory HomeEvent.addCurrentLocationMarker() = _AddCurrentLocationMarker;
  const factory HomeEvent.drawPolylineToDataLocation() = _DrawPolylineToDataLocation;
}
