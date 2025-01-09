import 'package:flutter/material.dart';
import 'SplashScreen1.dart';

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
        body: LayoutBuilder(
          builder: (context, constraints) {
            double imageWidth = constraints.maxWidth * 0.6;
            double titleFontSize = constraints.maxWidth * 0.06;
            double subtitleFontSize = constraints.maxWidth * 0.04;

            // Batas minimal dan maksimal untuk font agar tetap terbaca
            titleFontSize = titleFontSize.clamp(16.0, 32.0);
            subtitleFontSize = subtitleFontSize.clamp(12.0, 24.0);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Image
                  Image.asset(
                    'assets/images/AppLogo.png',
                    width: imageWidth.clamp(100.0, 300.0), // Batas ukuran gambar
                  ),
                  const SizedBox(height: 10), // Jarak antara logo dan teks
                  // App Name
                  Text(
                    "NaikPete'",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF42C8DC),
                    ),
                  ),
                  // Subtitle
                  Text(
                    "Layanan Pete-Pete Online",
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
