import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_open_street_map/open_street_map.dart';
import 'package:latlong2/latlong.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> doctors = [
      {"name": "دار الطب", "lat": 26.555103288417282, "lng": 31.70732953335323},
      {
        "name": "El Helal Hospital",
        "lat": 26.559244975143987,
        "lng": 31.6956741324039,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Map', style: TextStyle(color: Colors.white)),
      ),

      body: FlutterMap(
        options: MapOptions(
          center: LatLng(26.559081642158755, 31.695663533966375),
          zoom: 13.0,
          maxZoom: 18,
          minZoom: 3,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'flutter_street_maps',
          ),
          MarkerLayer(
            markers:
                doctors.map((doc) {
                  return Marker(
                    point: LatLng(doc["lat"], doc["lng"]),
                    width: 80,
                    height: 80,
                    builder:
                        (ctx) => Icon(
                          Icons.local_hospital,
                          color: Colors.red,
                          size: 40,
                        ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
