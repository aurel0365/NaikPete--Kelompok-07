import 'package:flutter/material.dart';

import 'SplashScreen1';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke SplashScreen1 ketika area layar disentuh
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen1()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Image.asset(
                'assets/images/AppLogo.png',
                width: MediaQuery.of(context).size.width * 0.6, // Responsive width
              ),
              const SizedBox(height: 5), // Mengurangi jarak antara gambar dan teks
              // App Name
              Text(
                "NaikPete'",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF42C8DC),
                ),
              ),
              // Subtitle
              Text(
                "Layanan Pete-Pete Online",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}