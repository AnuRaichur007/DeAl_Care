import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({Key key}) : super(key: key);

  @override
  _LiveLocationState createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  Set<Marker> _markers={};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
        position: LatLng(15.4608369, 74.9926545),
        infoWindow: InfoWindow(
          title: 'Victoria Memorial',
          snippet: 'A Historical Place',
        ))
      );
    });
  }
  var locationMessage = "";
  // function that will get the current location of the user
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "$position.latitude, $position.longitude";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade600,
            title: Center(
              child: Text(
                'Live Location',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
              markers: _markers,
              initialCameraPosition: CameraPosition(
            target: LatLng(15.4608369, 74.9926545),
            zoom: 15,
          ))

          // body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.location_on,
          //         size: 46.0,
          //         color: Colors.teal.shade700,
          //       ),
          //       SizedBox(
          //         height: 10.0,
          //       ),
          //       Text(
          //         'Get User Location',
          //         style: TextStyle(
          //           fontSize: 20.0,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20.0,
          //       ),
          //       Text(locationMessage),
          //       Card(
          //         color: Colors.grey.shade700,
          //         child: TextButton(
          //           onPressed: () {
          //             getCurrentLocation();
          //           },
          //           child: Text(
          //             "Get Current Location",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
