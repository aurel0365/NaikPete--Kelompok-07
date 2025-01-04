import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapWithGraphHopperState();
}

class _MapWithGraphHopperState extends State<MapScreen> {
  // Lokasi awal dan tujuan
  final LatLng startPoint = LatLng(-5.135399, 119.423790); // Contoh: Lokasi A
  final LatLng endPoint = LatLng(-5.148952, 119.438731); // Contoh: Lokasi B

  // Data untuk rute
  List<LatLng> routePoints = [];

  @override
  void initState() {
    super.initState();
    _fetchRoute(); // Panggil API GraphHopper saat widget dimulai
  }

  Future<void> _fetchRoute() async {
  const String graphHopperApiKey = '4585cd0b-2f46-437c-9868-3645837b62e3'; // Ganti dengan API Key Anda
  final String url =
      'https://graphhopper.com/api/1/route?point=${startPoint.latitude},${startPoint.longitude}&point=${endPoint.latitude},${endPoint.longitude}&vehicle=car&locale=en&instructions=false&key=$graphHopperApiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Ambil data koordinat dari GeoJSON
      final List<dynamic> points = data['paths'][0]['points']['coordinates'];

      // Ubah setiap pasangan [lon, lat] menjadi LatLng
      setState(() {
        routePoints = points.map((point) {
          if (point is List && point.length >= 2) {
            return LatLng(point[1], point[0]); // Ubah [lon, lat] menjadi [lat, lon]
          }
          return null;
        }).where((point) => point != null).toList().cast<LatLng>();
      });
    } else {
      debugPrint('Failed to fetch route: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error fetching route: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Peta dengan Rute (GraphHopper)'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-5.135399, 119.423790), // Lokasi awal
          zoom: 14.0,
        ),
        nonRotatedChildren: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: startPoint,
                builder: (context) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              Marker(
                point: endPoint,
                builder: (context) => const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
          if (routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blue,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
