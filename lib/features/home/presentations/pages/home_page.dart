import 'package:barikoi/features/core/path/file_path.dart';
import 'dart:async';
import 'package:maplibre_gl/maplibre_gl.dart' as maplibre;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  late maplibre.MapLibreMapController mController;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    homeBloc.add(const HomeEvent.permissionRequested());
    homeBloc.add(const HomeEvent.dataLoaded());
    homeBloc.add(const HomeEvent.locationServiceChecked());
    homeBloc.add(const HomeEvent.mapInitialized());
  }

  Future<void> _refresh() async {
    homeBloc.add(const HomeEvent.permissionRequested());
    homeBloc.add(const HomeEvent.dataLoaded());
    homeBloc.add(const HomeEvent.locationServiceChecked());
    homeBloc.add(const HomeEvent.mapInitialized());
  }

  @override
  void dispose() {
    context.read<HomeBloc>().close();
    super.dispose();
  }

  Future<void> _showLocationDialog(BuildContext context,
      {required bool serviceEnabled, bool permissionDenied = false}) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(permissionDenied
            ? 'Location Permission Required'
            : 'Location Services Disabled'),
        content: Text(permissionDenied
            ? 'Please allow location permission to access the map features.'
            : 'Location services are disabled. Please enable location services to continue.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              if (!permissionDenied) {
                homeBloc.add(const HomeEvent.locationServiceChecked());
              } else {
                homeBloc.add(const HomeEvent.permissionRequested());
              }
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (context, state) {
            if (!state.locationServiceEnabled) {
              _showLocationDialog(context, serviceEnabled: false);
            } else if (!state.permissionGranted) {
              _showLocationDialog(context,
                  serviceEnabled: true, permissionDenied: true);
            }

            if (state.status == HomeStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return maplibre.MapLibreMap(
                initialCameraPosition: maplibre.CameraPosition(
                  target: maplibre.LatLng(23.835677, 90.380325),
                  zoom: 12,
                ),
                onMapCreated: (controller) {
                  mController = controller;
                },
                styleString:
                    'https://map.barikoi.com/styles/osm-liberty/style.json?key=AIzaSyBPFXXCpBJPpjS1w0h9kIQfTlt0r6HL2G0',
              );
            }
          },
        ),
      ),
    );
  }
}
