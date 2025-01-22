import 'package:flutter/material.dart';

class Jadwalberangkat extends StatelessWidget {
  const Jadwalberangkat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Set the background color of the entire screen to white
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Tinggi total AppBar dengan padding
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 1,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 16), // Tambahkan jarak di atas teks
            child: const Text(
              'Jadwal Berangkat',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: const JadwalSemua(),
    );
  }
}

class JadwalSemua extends StatefulWidget {
  const JadwalSemua({super.key});

  @override
  _JadwalSemuaState createState() => _JadwalSemuaState();
}

class _JadwalSemuaState extends State<JadwalSemua> {
  final List<Map<String, String>> _jadwal = [
    {
      'name': 'Pete-pete A',
      'rute': 'UC Makassar-Mall Nipah',
      'date': 'Wed Jun 20',
      'time': '8:00 - 8:30 AM',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Pete-pete B',
      'rute': 'Mall Trans Makassar-Mall Panakukkang',
      'date': 'Thu Jun 21',
      'time': '8:00 - 8:30 AM',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Pete-pete C',
      'rute': 'Pasar Sentral-SMA Rajawali Makassar',
      'date': 'Thu Jun 21',
      'time': '8:00 - 8:30 AM',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  List<Map<String, String>> _filteredJadwal = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredJadwal = _jadwal;

    // Update the search results when the text changes
    _searchController.addListener(() {
      _filterJadwal();
    });
  }

  void _filterJadwal() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredJadwal = _jadwal.where((jadwal) {
        return jadwal['name']!.toLowerCase().contains(query) ||
            jadwal['rute']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Cari jadwal...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: _filteredJadwal.isEmpty
              ? Center(
                  child: Text(
                    'Hasil pencarian anda tidak ada',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: _filteredJadwal.length,
                  itemBuilder: (context, index) {
                    final jadwal = _filteredJadwal[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: Colors.white,  // Set the card background to white
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(jadwal['image']!),
                          radius: 30,
                        ),
                        title: Text(
                          jadwal['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(jadwal['rute']!, style: const TextStyle(color: Colors.grey)),
                            const SizedBox(height: 4),
                            Text('${jadwal['date']}  \u2022  ${jadwal['time']}',
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        trailing: const Icon(Icons.more_vert, color: Colors.grey),
                        onTap: () {},
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
