/*
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  const MapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Set<Marker> _markers = {}; // Change to Set
  bool selectedMarker = false;
  Completer<GoogleMapController> googleMapController = Completer();
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            compassEnabled: true,
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            markers: _markers,
          );
        }),
      ),
    );
  }
}
*/
