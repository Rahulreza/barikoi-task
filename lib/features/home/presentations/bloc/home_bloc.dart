import 'package:barikoi/features/core/path/file_path.dart';
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
      );
    });
  }
  _dataLoaded(_DataLoaded event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.initial));
    print("I am from home bloc before try");
    try {
      print("I am from home bloc after try");
      final reverceGeocodingDataResponse =
          await homeRepository.reverceGeoCodingMapDataSubmit();
      emit(state.copyWith(
        reverceModelDataResponce: reverceGeocodingDataResponse,
        status: HomeStatus.success,
      ));
      print(
          "I am from home bloc reverceGeocodingDataResponse: $reverceGeocodingDataResponse");
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
}
