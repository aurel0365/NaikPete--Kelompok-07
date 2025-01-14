import 'package:flutter/material.dart';
import 'SplashScreen2.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Mendapatkan dimensi layar
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Menentukan ukuran responsif untuk elemen UI
          double circleSize = screenWidth * 0.5; // 50% dari lebar layar
          double titleFontSize = screenWidth * 0.05; // 5% dari lebar layar
          double subtitleFontSize = screenWidth * 0.035; // 3.5% dari lebar layar
          double buttonFontSize = screenWidth * 0.04; // 4% dari lebar layar

          // Batas minimal dan maksimal ukuran font agar tetap terbaca
          titleFontSize = titleFontSize.clamp(18.0, 30.0);
          subtitleFontSize = subtitleFontSize.clamp(14.0, 24.0);
          buttonFontSize = buttonFontSize.clamp(14.0, 20.0);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Background Shape
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: circleSize.clamp(150.0, 300.0),
                      height: circleSize.clamp(150.0, 300.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(circleSize / 2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05), // Jarak antar elemen

                // Text Section
                Text(
                  'Temukan Perjalanan Kenyamanan \nAnda di sini',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Nikmati perjalanan tanpa ribet dengan pete-pete.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Jarak antar elemen

                // Button Section
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const SplashScreen2(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);  // Mulai dari bawah
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(position: offsetAnimation, child: child),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.2,
                    ),
                    child: Text(
                      'Selanjutnya',
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
