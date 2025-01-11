import 'package:flutter/material.dart';
import 'MetodePembayaran.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40), // Menambah jarak atas
                  // Header dengan ikon dan teks
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.confirmation_num, color: Color(0xFF42C8DC), size: 35),
                        SizedBox(width: 12),
                        Text(
                          'Rincian Pembelian',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF42C8DC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Card container untuk rincian tiket
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.grey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildDetailRow('Jenis Tiket', 'One Day Pass'),
                            _buildDetailRow('Jumlah Tiket', '1'),
                            _buildDetailRow('Harga Per Tiket', 'IDR 7,000'),
                            Divider(thickness: 1.5, color: Colors.grey.withOpacity(0.5)),
                            _buildDetailRow(
                              'Total Pembayaran', 
                              'IDR 7,000', 
                              isTotal: true
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60), // Tambah jarak bawah
                  // Tombol "Lanjut ke Pembayaran"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF42C8DC), 
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.4),
                      elevation: 12,
                    ),
                    child: Text(
                      "Lanjut ke Pembayaran",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildCustomBackButton(context), // Menambahkan tombol kembali
        ],
      ),
    );
  }

  // Helper function untuk membuat row rincian tiket
  Widget _buildDetailRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.green : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Widget tombol kembali kustom
  Widget _buildCustomBackButton(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(51, 83, 232, 255), // Latar belakang soft blue
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF42C8DC)), // Ikon biru
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
      ),
    );
  }
}
