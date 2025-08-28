import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';


class FlutterMapPage extends StatefulWidget {
  const FlutterMapPage({super.key});

  @override
  State<FlutterMapPage> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {
  // initial variables
  MapController mapController = MapController();
  LatLng myPosition = LatLng(0, 0);
  Location location = Location();
  String status = 'Loading';

  getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      //check if the location service was enable or not
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      //if the location was denied it will ask next time the user enter the screen
      if (permissionGranted != PermissionStatus.granted) {
        //in case of denied you can add any thing here like error message or something else
        setState(() {
          status = 'Access Denied';
        });
      }
    }

    // get current location AND move the map's camera to the location
    LocationData currentPosition = await location.getLocation();
    myPosition = LatLng(currentPosition.latitude!, currentPosition.longitude!);
    setState(() {
      mapController.move(myPosition, 13.0);
      status = 'Location Found';
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                'Your current location',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          backgroundColor: Colors.green[800],
        ),
        body: Center(
          child: Column(children: [
            // Spacing widget
            const SizedBox(height: 40),
            // Flutter Map Widget here
            Container(
              height: 400,
              width: 400,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: myPosition,
                  zoom: 12,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: myPosition,
                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // text widgets
            const SizedBox(height: 20),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            Text(
              'Latitude: ${myPosition.latitude}',
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10),
            Text(
              'Longitude: ${myPosition.longitude}',
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.right,
            ),
          ]),
        ));
  }
}
