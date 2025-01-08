import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'homeUser.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Background Shape
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),

            // Text Section
            Column(
              children: [
                Text(
                  'NaikPete : Tempatnya Perjalanan \n Nyamanmu Dimulai!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Nikmati perjalanan Naik Pete-Pete dengan kenyamanan dan pilihan rute terbaik!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),

            // Button Section
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman LokasiDetailScreen ketika tombol "Selanjutnya" ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreens(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 40.w,
                ),
                child: Text(
                  'Selanjutnya',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
