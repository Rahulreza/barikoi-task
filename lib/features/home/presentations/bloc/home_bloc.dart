import 'package:barikoi/features/core/path/file_path.dart';
import 'package:barikoi/features/core/path/image_path.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart' as maplibre;

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final Location location = Location();

  HomeBloc({required this.homeRepository}) : super(const HomeState()) {
    on<HomeEvent>((events, emit) async {
      await events.map(
        dataLoaded: (event) async => await _dataLoaded(event, emit),
        mapInitialized: (event) async => await _mapInitialized(event, emit),
        locationServiceChecked: (event) async =>
            await _locationServiceChecked(event, emit),
        permissionRequested: (event) async =>
            await _permissionRequested(event, emit),
        currentLocationRequested: (event) async =>
            await _getCurrentLocation(event, emit),
        addCurrentLocationMarker: (event) async =>
            await _addCurrentLocationMarker(event, emit),
        drawPolylineToDataLocation: (event) async =>
            await _drawPolylineToDataLocation(event, emit),
      );
    });
  }
  _dataLoaded(_DataLoaded event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.initial));
    if (kDebugMode) {
      print("I am from home bloc before try");
    }
    try {
      if (kDebugMode) {
        print("I am from home bloc after try");
      }
      final reverceGeocodingDataResponse =
          await homeRepository.reverceGeoCodingMapDataSubmit();
      final placeLocation =
          maplibre.LatLng(23.823862245054432, 90.36452020536662);
      emit(state.copyWith(
        reverceModelDataResponce: reverceGeocodingDataResponse,
        dataLocation: placeLocation,
        status: HomeStatus.success,
      ));
      if (kDebugMode) {
        print(
            "I am from home bloc reverceGeocodingDataResponse: $reverceGeocodingDataResponse");
      }
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> _mapInitialized(
      _MapInitialized event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.success));
  }

  Future<void> _locationServiceChecked(
      _LocationServiceChecked event, Emitter<HomeState> emit) async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    emit(state.copyWith(locationServiceEnabled: serviceEnabled));
  }

  Future<void> _permissionRequested(
      _PermissionRequested event, Emitter<HomeState> emit) async {
    PermissionStatus permission = await location.hasPermission();

    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
    }
    emit(state.copyWith(
        permissionGranted: permission == PermissionStatus.granted));
  }

  Future<void> _getCurrentLocation(
      _CurrentLocationRequested event, Emitter<HomeState> emit) async {
    if (kDebugMode) {
      print("Getting current location...");
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (kDebugMode) print("Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition();
        if (kDebugMode) {
          print("position: $position");
        }
        final currentLocation =
            maplibre.LatLng(position.latitude, position.longitude);
        if (kDebugMode) {
          print("currentLocation: $currentLocation");
        }
        emit(state.copyWith(
            currentLocation: currentLocation, status: HomeStatus.success));
      } catch (e) {
        emit(state.copyWith(status: HomeStatus.failure));
        if (kDebugMode) print("Error getting current location: $e");
      }
    } else {
      if (kDebugMode) print("Location permission denied.");
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> _addCurrentLocationMarker(
      _AddCurrentLocationMarker event, Emitter<HomeState> emit) async {
    if (kDebugMode) {
      print("stateLocation:${state.currentLocation} ${event.mapLibController}");
    }
    try {
      await event.mapLibController.addSymbol(
        maplibre.SymbolOptions(
          geometry: state.currentLocation,
          iconImage: "assets/images/current_location.png",
          iconSize: 0.2,
        ),
      );
      emit(state.copyWith(status: HomeStatus.success));
      if (kDebugMode) {
        print("Current Location Marker Added!");
      }
    } catch (e) {
      if (kDebugMode) {
        print("AddCurrent Location Error: $e");
      }
    }
  }


  Future<void> _drawPolylineToDataLocation(
      _DrawPolylineToDataLocation event, Emitter<HomeState> emit) async {
    if (kDebugMode) {
      print(
          "All Data: ${event.mapLibController} ${state.currentLocation} ${state.dataLocation}");
      print("Drawing polyline from current location to data location");
    }

    await event.mapLibController.addLine(
      maplibre.LineOptions(
        geometry: [state.currentLocation, state.dataLocation],
        lineColor: "#FF5733",
        lineWidth: 4.0,
      ),
    );

    await event.mapLibController.addSymbol(
      maplibre.SymbolOptions(
        geometry: state.dataLocation,
        iconImage: LocationIcon.sourceLocationIcon,
        iconSize: 0.5,
      ),
    );

    emit(state.copyWith(status: HomeStatus.success));

    if (kDebugMode) {
      print("Polyline drawn and symbol added at data location");
    }
    }
}
