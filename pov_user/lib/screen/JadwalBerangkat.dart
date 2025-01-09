import 'package:flutter/material.dart';
import 'LihatLokasi.dart';

class Jadwalberangkat extends StatelessWidget {
  const Jadwalberangkat({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, 
          foregroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false, 
          toolbarHeight: 100, 
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30), 
              const Text(
                'Jadwal Berangkat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Color(0xFF42C8DC), // Warna biru untuk teks tab aktif
            unselectedLabelColor: Colors.grey, // Warna abu-abu untuk teks tab non-aktif
            indicatorColor: Color(0xFF42C8DC), // Garis bawah tab aktif (biru)
            indicatorWeight: 3.0,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Semua Jadwal'),
              Tab(text: 'Terdekat'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(), // Smooth scroll physics
          children: [
            // Semua Jadwal Tab
            const JadwalSemua(),
            // Terdekat Tab
            const JadwalTerdekat(),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan Semua Jadwal dengan fitur pencarian
class JadwalSemua extends StatelessWidget {
  const JadwalSemua({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Silahkan Mencari Jadwal...",
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5, // Jumlah jadwal yang ditampilkan
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://via.placeholder.com/80', // Ganti dengan gambar asli
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text(
                    '11 Nov, 07.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'MP – Jalan Boulevard\nPanakkukang – Jalan Pettarani – Jalan Veteran',
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                  trailing: const Text(
                    'Lihat lokasi',
                    style: TextStyle(
                      color: Color(0xFF42C8DC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Navigasi ke halaman LokasiDetailScreen ketika tombol "Lihat lokasi" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lihatlokasi(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Widget untuk menampilkan Jadwal Terdekat dengan fitur pencarian
class JadwalTerdekat extends StatelessWidget {
  const JadwalTerdekat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Silahkan Mencari Jadwal Terdekat...",
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3, // Jumlah jadwal terdekat yang ditampilkan
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://via.placeholder.com/80', // Ganti dengan gambar asli
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text(
                    '11 Nov, 08.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Jalan Sejahtera – Mall XYZ',
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                  trailing: const Text(
                    'Lihat lokasi',
                    style: TextStyle(
                      color: Color(0xFF42C8DC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Navigasi ke halaman LokasiDetailScreen ketika tombol "Lihat lokasi" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Lihatlokasi(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}