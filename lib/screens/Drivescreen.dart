import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DriverScreen extends StatefulWidget {
  final String trayekName;
  final String goRoute;
  final String backRoute;
  final List<LatLng> routePoints; // Tambahkan rute points
  final int passengerCount; // Jumlah penumpang

  const DriverScreen({
    required this.trayekName,
    required this.goRoute,
    required this.backRoute,
    required this.routePoints, // Terima rute points
    required this.passengerCount, // Terima jumlah penumpang
    Key? key,
  }) : super(key: key);

  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    final int maxSeats = 12; // Maksimal kapasitas kursi
    double percentage = widget.passengerCount / maxSeats;
    Color indicatorColor;
    String indicatorText;

    // Logika warna indikator berdasarkan jumlah penumpang
    if (percentage == 1) {
      indicatorColor = Colors.red; // Penuh
      indicatorText = "12/12, sudah penuh!";
    } else if (percentage >= 0.5) {
      indicatorColor = Colors.orange; // Setengah penuh
      indicatorText = "${widget.passengerCount}/12, kursi hampir penuh!";
    } else {
      indicatorColor = Colors.green; // Masih banyak kursi
      indicatorText = "${widget.passengerCount}/12, masih bisa narik!";
    }

    return Scaffold(
      body: Stack(
        children: [
          // Peta dengan rute
          FlutterMap(
            options: MapOptions(
              center: widget.routePoints.isNotEmpty
                  ? widget.routePoints.first
                  : LatLng(-5.147665, 119.432731), // Pusat peta di lokasi pertama
              zoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: widget.routePoints,
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          // Indikator penumpang
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  indicatorText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Panel informasi rute dan tombol
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trayek pete - pete anda",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.trayekName,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.directions_bus, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Rute berangkat: ${widget.goRoute}",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.directions_bus, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Rute balik: ${widget.backRoute}",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Kembali ke halaman home saat tombol "Berhenti Narik" ditekan
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Warna merah untuk tombol berhenti
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Center(
                      child: Text(
                        "Berhenti Narik",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}