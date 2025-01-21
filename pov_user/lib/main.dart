import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screen/LayarLogo.dart';  // Pastikan path ini benar sesuai struktur folder Anda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Ukuran desain dasar aplikasi (misalnya iPhone 7)
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LogoScreen(),  // Ganti dengan screen pertama yang ingin Anda tampilkan
        );
      },
    );
  }
}