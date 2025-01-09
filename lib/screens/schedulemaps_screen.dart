import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key, required Map<String, dynamic> trayek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Titik-titik koordinat untuk Polyline
    final List<LatLng> polylinePoints = [
      LatLng(-5.1862518741076, 119.4549252153959), // Lokasi A
      LatLng(-5.189225844106793, 119.44795864917056), // Lokasi B
      LatLng(-5.1746123048921335, 119.43298482917724), // Lokasi C
      LatLng(-5.172427182002852, 119.42201452341928), // Lokasi D
      LatLng(-5.178739738645198, 119.41969856998148), // Lokasi E
      LatLng(-5.164657795101395, 119.4172607242575), // Lokasi F
      LatLng(-5.133093353032515, 119.41216306861821), // Lokasi G
      LatLng(-5.1309012556305555, 119.41381375888604), // Lokasi H
      LatLng(-5.1281611232884945, 119.41359366685033), // Lokasi I
      LatLng(-5.134568360110945, 119.4956636125877), // Lokasi J
      LatLng(-5.123353640137265, 119.41222685030239), // Lokasi K
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trayek peta A"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-5.135399, 119.423790), // Lokasi awal (pusat peta)
          zoom: 14.0,
        ),
        nonRotatedChildren: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          // Layer Marker untuk menunjukkan titik awal dan tujuan
          // MarkerLayer(
          //   markers: [
          //     Marker(
          //       point: LatLng(-5.135399, 119.423790), // Lokasi A
          //       builder: (context) => const Icon(
          //         Icons.location_on,
          //         color: Colors.red,
          //         size: 30,
          //       ),
          //     ),
          //     Marker(
          //       point: LatLng(-5.148952, 119.438731), // Lokasi B
          //       builder: (context) => const Icon(
          //         Icons.location_on,
          //         color: Colors.blue,
          //         size: 30,
          //       ),
          //     ),
          //   ],
          // ),
          // PolylineLayer untuk menggambar rute manual
          PolylineLayer(
            polylines: [
              Polyline(
                points: polylinePoints, // Titik-titik koordinat
                strokeWidth: 4.0, // Ketebalan garis
                color: Colors.blue, // Warna garis
              ),
            ],
          ),
        ],
      ),
    );
  }
}
