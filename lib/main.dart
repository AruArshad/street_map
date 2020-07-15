import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: StreetMap(),
  ));
}

class StreetMap extends StatelessWidget {
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;

  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    userLocationOptions = UserLocationOptions(
      context: context,
      mapController: mapController,
      markers: markers,
    );

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(7.8774222, 80.7003428),
          zoom: 11.0,
          plugins: [
            UserLocationPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: markers,
          ),
          userLocationOptions,
        ],
        mapController: mapController,
      ),
    );
  }
}

//          markers: [
////            Marker(
////              width: 80.0,
////              height: 80.0,
////              point: LatLng(6.9373, 79.8718),
////              builder: (ctx) => Container(
////                  //child: FlutterLogo(),
////                  ),
////            ),
//          ],
