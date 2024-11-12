import 'package:barikoi/features/core/path/file_path.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    homeBloc.add(const HomeEvent.locationServiceChecked());
    homeBloc.add(const HomeEvent.mapInitialized());
    homeBloc.add(const HomeEvent.currentLocationRequested());
    homeBloc.add(const HomeEvent.dataLoaded());
  }

  Future<void> _refresh() async {
    homeBloc.add(const HomeEvent.permissionRequested());
    homeBloc.add(const HomeEvent.locationServiceChecked());
    homeBloc.add(const HomeEvent.mapInitialized());
    homeBloc.add(const HomeEvent.currentLocationRequested());
    homeBloc.add(const HomeEvent.dataLoaded());
  }

  Future<void> _showLocationDialog(BuildContext context,
      {required bool serviceEnabled, bool permissionDenied = false}) async {
    await showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
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
                  homeBloc.add(
                    permissionDenied
                        ? const HomeEvent.permissionRequested()
                        : const HomeEvent.locationServiceChecked(),
                  );
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

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
          /*    if (state.status == HomeStatus.showDialog) {
                Fluttertoast.showToast(
                  msg: "BariKoi: ${state.reverceModelDataResponce.place}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }*/
              if (!state.locationServiceEnabled) {
                _showLocationDialog(context, serviceEnabled: false);
              } else if (!state.permissionGranted) {
                _showLocationDialog(context,
                    serviceEnabled: true, permissionDenied: true);
              }

              if (state.status == HomeStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == HomeStatus.failure) {
                return const Center(child: Text('Failed to load data.'));
              } else {
                final initialCameraPosition = state.currentLocation;

                return maplibre.MapLibreMap(
                  initialCameraPosition: maplibre.CameraPosition(
                    target: initialCameraPosition,
                    zoom: 12,
                  ),
                  onMapCreated: (controller) async {
                    mController = controller;
                    homeBloc.add(const HomeEvent.mapInitialized());
                    await Future.delayed(Duration(milliseconds: 500));
                    homeBloc.add(HomeEvent.addCurrentLocationMarker(
                        mapLibController: mController));
                    homeBloc.add(HomeEvent.addDestinationLocationMarker(
                        mapLibController: mController, context: context));

                    mController.onSymbolTapped.add((symbol) {
                      // Show the toast every time the marker is clicked
                      Fluttertoast.showToast(
                        msg: "BariKoi: ${state.reverceModelDataResponce.place}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );

                      // Dispatch event to show location dialog
                      homeBloc.add(HomeEvent.showLocationDialog(context: context));
                    });



                    /* mController.onSymbolTapped.add((symbol) {
                      homeBloc.add(
                          HomeEvent.showLocationDialog(context: context
                          ));
                     // state.status==HomeStatus.showDialog?Toast:null;
                      *//*showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location Details',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text('Place Name: '),
                                const SizedBox(height: 5),
                                Text('Address: '),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: (){},
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      );*//*

                    });*/

                  },

                  styleString:
                  'https://map.barikoi.com/styles/osm-liberty/style.json?key=bkoi_5bacf61a76e5047364b3540a662f1ee5865f03ef8736d7475f18538c3fb52a8e',
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
