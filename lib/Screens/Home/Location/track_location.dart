import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final geoService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      initialData: null,
      create: (context) => geoService.getInitialLocation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade600,
            title: Center(
              child: Text(
                'LIVE LOCATION',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                ),
              ),
            ),
          ),
          body: Consumer<Position>(
            builder: (context, position, widget) {
              return (position != null)
                  ? Map(position)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class Map extends StatefulWidget {
  final Position initialPosition;

  Map(this.initialPosition);

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.initialPosition.latitude,
                  widget.initialPosition.longitude),
              zoom: 10.0),
          mapType: MapType.normal,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  }
}

class GeolocatorService {
  final Geolocator geo = Geolocator();

  Stream<Position> getCurrentLocation(){
    // var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    return Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high, distanceFilter: 10);
  }

  Future<Position> getInitialLocation() async {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}