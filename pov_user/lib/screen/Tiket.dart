import 'package:flutter/material.dart';
import 'ConfirmTiket.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Gambar tiket dengan bayangan
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 600,
                          maxHeight: 300,
                        ),
                        child: Image.asset(
                          'assets/images/Tiket.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Nama tiket
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double fontSize = constraints.maxWidth > 600 ? 26 : 22;
                      return Text(
                        "Tiket One Day",
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF42C8DC),
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),

                  // Deskripsi tiket
                  const Text(
                    "Nikmati perjalanan seharian penuh dengan tiket satu hari.\nAkses ke seluruh rute tanpa batas!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Harga tiket
                  const Text(
                    "Harga: IDR 7,000",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF42C8DC),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Tombol beli tiket
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF42C8DC),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.5),
                      elevation: 8,
                    ),
                    child: const Text(
                      "Beli Tiket",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Catatan tambahan (opsional)
                  const Text(
                    "*Tiket berlaku untuk satu hari penuh",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
