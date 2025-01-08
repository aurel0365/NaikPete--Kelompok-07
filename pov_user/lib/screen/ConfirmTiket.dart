import 'package:flutter/material.dart';
import 'MetodePembayaran.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Ganti background menjadi putih
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Membuat konten scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30), // Menurunkan posisi konten dari atas
              // Header dengan ikon dan teks
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.confirmation_num, color: Color(0xFF42C8DC), size: 30),
                    SizedBox(width: 12),
                    Text(
                      'Rincian Pembelian',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF42C8DC),
                      ),
                    ),
                  ],
                ),
              ),
              // Card container untuk rincian tiket
              Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
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
              SizedBox(height: 50),
              // Tombol "Lanjut ke Pembayaran"
              ElevatedButton(
                onPressed: () {
                  // Arahkan ke halaman Pilihan Pembayaran
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF42C8DC), // Warna utama biru
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.grey.withOpacity(0.4),
                  elevation: 8,
                ),
                child: Text(
                  "Lanjut ke Pembayaran",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function untuk membuat row rincian tiket
  Widget _buildDetailRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.green : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}